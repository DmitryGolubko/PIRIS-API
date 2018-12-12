class ATMService
  def self.credit_withdraw(sum, account)
    cashbox = Account.find_by(account_type: 'cashbox', currency: account.currency)
    transactions = []
    errors = []
    errors.push('not enough money') if account.balance < sum
    errors.push('contract has been already closed') if account.client.credit_contract.closed?

    if errors.empty?
      transactions << Transaction.create!(sum: sum, source_account: account, destination_account: cashbox)
      transactions << Transaction.create!(sum: sum, source_account: cashbox)
    end
    [transactions, errors]
  end

  def self.credit_payment(sum, account)
    cashbox = Account.find_by(account_type: 'cashbox', currency: account.currency)
    transactions = []
    errors = []
    messages = []
    errors.push('credit is already closed') if account.client.credit_contract.closed?
    if errors.empty?
      transactions << Transaction.create!(sum: sum, destination_account: cashbox)
      transactions << Transaction.create!(sum: sum, source_account: cashbox, destination_account: account)
    end
    if 2 * account.client.credit_contract.sum <= account.debit
      account.client.credit_contract.closed!
      messages.push('credit is closed')
    end
    [transactions, errors, messages]
  end

  def self.deposit_withdraw(sum, account)
    cashbox = Account.find_by(account_type: 'cashbox', currency: account.currency)
    development_fund = Account.find_by(account_type: 'development_fund', currency: account.currency)
    transactions = []
    errors = []
    errors.push('contract has been already closed') if account.client.deposit_contract.closed?
    errors.push('sum cannot be more than balance') if 2 * account.client.deposit_contract.sum < account.credit + sum

    if errors.empty?
      transactions << Transaction.create!(sum: sum, source_account: development_fund, destination_account: account)
      transactions << Transaction.create!(sum: sum, source_account: account, destination_account: cashbox)
      transactions << Transaction.create!(sum: sum, source_account: cashbox)
    end
    [transactions, errors]
  end
end
