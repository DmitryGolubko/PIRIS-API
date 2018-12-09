class BankController < BaseController
  def close_day
    transactions = BankService.close_day
    render json: transactions
  end

  def route_to_the_dream; end
end
