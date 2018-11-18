class BankController < BaseController
  def close_day
    transactions = BankService.close_day
    render json: transactions
  end
end
