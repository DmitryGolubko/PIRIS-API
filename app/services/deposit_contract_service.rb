class DepositContractService
  def self.create(deposit_contract_params)
    deposit_contract = DepositContract.new(deposit_contract_params)
    deposit = Deposit.includes(:currency).find(deposit_contract.deposit_id)
    client = Client.find(deposit_contract.client_id)
    deposit_contract.sum = deposit_contract.sum.to_d
    deposit_contract.ends_at = deposit_contract.starts_at + deposit.duration.months
    deposit_contract.assign_attributes(current_account: build_account(deposit_contract, deposit, client, 'Current account'),
                                       percent_account: build_account(deposit_contract, deposit, client, 'Percent account'))
    deposit_contract.save
    deposit_contract
  end

  def self.build_account(deposit_contract, deposit, client, account_name)
    Account.create!(client: deposit_contract.client, currency: deposit.currency,
                    name: "#{client.full_name}. #{account_name}", activity: 'passive', account_type: 'deposit')
  end
end
