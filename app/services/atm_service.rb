class ATMService
  def self.credit_withdraw(sum, account)
    cashbox = Account.find_by(account_type: 'cashbox', currency: account.currency)
    transactions = []
    transactions << Transaction.create!(sum: sum, source_account: account,
                                        destination_account: cashbox)
    transactions << Transaction.create!(sum: sum, source_account: cashbox)
  end

  def self.credit_payment(sum, account)
    cashbox = Account.find_by(account_type: 'cashbox', currency: account.currency)
    transactions = []
    transactions << Transaction.create!(sum: sum, destination_account: cashbox)
    transactions << Transaction.create!(sum: sum, source_account: cashbox, destination_account: account)
    # transactions << Transaction.create!(sum: sum, source_account: cashbox, destination_account: account)
  end

  def self.deposit_withdraw(sum, account)
    cashbox = Account.find_by(account_type: 'cashbox', currency: account.currency)
    development_fund = Account.find_by(account_type: 'development_fund', currency: account.currency)
    transactions = []
    transactions << Transaction.create!(sum: sum, source_account: development_fund, destination_account: account)
    transactions << Transaction.create!(sum: sum, source_account: account, destination_account: cashbox)
    transactions << Transaction.create!(sum: sum, source_account: cashbox)
  end
end
