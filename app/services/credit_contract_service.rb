class CreditContractService
  def self.create(credit_contract_params)
    credit_contract = CreditContract.new(credit_contract_params)
    credit = Credit.includes(:currency).find(credit_contract.credit_id)
    client = Client.find(credit_contract.client_id)
    credit_contract.sum = credit_contract.sum.to_d
    credit_contract.ends_at = credit_contract.starts_at + credit.duration.months
    credit_contract.assign_attributes(current_account: build_account(credit_contract, credit, client, 'Current account'),
                                      percent_account: build_account(credit_contract, credit, client, 'Percent account'))
    transactions = make_transactions(credit_contract, credit) if credit_contract.save
    [credit_contract, transactions]
  end

  def self.build_account(credit_contract, credit, client, account_name)
    Account.create!(client: credit_contract.client, currency: credit.currency,
                    name: "#{client.full_name}. #{account_name}", activity: 'active', account_type: 'credit')
  end

  def self.make_transactions(credit_contract, credit)
    development_fund = Account.find_by(account_type: 'development_fund', currency: credit.currency)
    transactions = []
    transactions << Transaction.create!(sum: credit_contract.sum, source_account: development_fund,
                                        destination_account: credit_contract.current_account)
  end
end
