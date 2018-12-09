require 'jwt'

class AtmController < BaseController
  def login
    if Account.find_by(login_params).present?
      render json: { token: JWT.encode(login_params.to_json, nil, 'none') }
    else
      render json: { error: 'not found' }.to_json, status: 404
    end
  end

  def balance
    @account = Account.find_by(JSON.parse(JWT.decode(action_params[:token], nil, false).first))
    if @account.present? && @account.name.include?('Current account')
      render json: { account: { id: @account.id, name: @account.name, balance: @account.balance, debit: @account.debit,
                                credit: @account.credit } }
    else
      render json: { error: 'not found' }.to_json, status: 404
    end
  end

  def credit_withdraw
    @account = Account.find_by(JSON.parse(JWT.decode(credit_action_params[:token], nil, false).first))
    if @account.present? && @account.name.include?('Current account') && @account.credit?
      @transactions = ATMService.credit_withdraw(credit_action_params[:amount], @account)
      render json: { transactions: @transactions }
    else
      render json: { error: 'not found' }.to_json, status: 404
    end
  end

  def credit_payment
    @account = Account.find_by(JSON.parse(JWT.decode(credit_action_params[:token], nil, false).first))
    if @account.present? && @account.name.include?('Current account') && @account.credit?
      @transactions = ATMService.credit_payment(credit_action_params[:amount], @account)
      render json: { transactions: @transactions }
    else
      render json: { error: 'not found' }.to_json, status: 404
    end
  end

  def deposit_withdraw
    @account = Account.find_by(JSON.parse(JWT.decode(credit_action_params[:token], nil, false).first))
    if @account.present? && @account.name.include?('Current account') && @account.deposit?
      @transactions = ATMService.deposit_withdraw(credit_action_params[:amount], @account)
      render json: { transactions: @transactions }
    else
      render json: { error: 'not found' }.to_json, status: 404
    end
  end

  private

  def credit_action_params
    params.require(:atm).permit(:token, :amount)
  end

  def action_params
    params.require(:atm).permit(:token)
  end

  def login_params
    params.require(:login).permit(:id, :pin)
  end
end
