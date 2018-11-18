class BankService
  def self.close_day
    transactions = []
    DepositContract.opened.each do |deposit_contract|
      development_fund = Account.find_by(account_type: 'development_fund', currency: deposit_contract.deposit.currency)
      transactions << Transaction.create!(sum: deposit_contract.sum * deposit_contract.deposit.percent / 100 / 365,
                                          source_account: development_fund,
                                          destination_account: deposit_contract.percent_account)
      DepositContractService.close(deposit_contract, transactions) if deposit_contract.ends_at < Time.zone.today
    end
    puts '**************'
    puts '**DAY CLOSED**'
    puts '**************'
    transactions
  end
end
