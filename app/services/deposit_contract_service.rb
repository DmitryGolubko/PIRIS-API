class DepositContractService
  def self.create(deposit_contract_params)
    deposit_contract = DepositContract.new(deposit_contract_params)
    deposit = Deposit.includes(:currency).find(deposit_contract.deposit_id)
    client = Client.find(deposit_contract.client_id)
    deposit_contract.sum = deposit_contract.sum.to_d
    deposit_contract.ends_at = deposit_contract.starts_at + deposit.duration.months
    deposit_contract.assign_attributes(current_account: build_account(deposit_contract, deposit, client, 'Current account'),
                                       percent_account: build_account(deposit_contract, deposit, client, 'Percent account'))
    transactions = make_transactions(deposit_contract, deposit) if deposit_contract.save
    [deposit_contract, transactions]
  end

  def self.build_account(deposit_contract, deposit, client, account_name)
    Account.create!(client: deposit_contract.client, currency: deposit.currency,
                    name: "#{client.full_name}. #{account_name}", activity: 'passive', account_type: 'deposit')
  end

  def self.make_transactions(deposit_contract, deposit)
    cashbox = Account.find_by(account_type: 'cashbox', currency: deposit.currency)
    development_fund = Account.find_by(account_type: 'development_fund', currency: deposit.currency)
    transactions = []
    transactions << Transaction.create!(sum: deposit_contract.sum, destination_account: cashbox)
    transactions << Transaction.create!(sum: deposit_contract.sum, source_account: cashbox,
                                        destination_account: deposit_contract.current_account)
    transactions << Transaction.create!(sum: deposit_contract.sum, source_account: deposit_contract.current_account,
                                        destination_account: development_fund)
  end

  def self.close(deposit_contract, transactions)
    development_fund = Account.find_by(account_type: 'development_fund', currency: deposit_contract.deposit.currency)
    transactions << Transaction.create!(sum: deposit_contract.sum, source_account: development_fund,
                                        destination_account: deposit_contract.current_account)
    deposit_contract.closed!
  end
end
