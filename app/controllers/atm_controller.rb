require 'jwt'

class AtmController < BaseController
  before_action :find_account, only: %i[balance credit_withdraw credit_payment deposit_withdraw]

  def login
    if !Account.find_by(number: login_params[:number]).present?
      render json: { error: 'account number is invalid' }.to_json, status: 404
    elsif Account.find_by(number: login_params[:number]).login_attempts >= 3
      Account.find_by(number: login_params[:number]).update_attributes(blocked: true)
      render json: { error: 'account is blocked' }.to_json, status: 401
    elsif !Account.find_by(pin: login_params[:pin]).present?
      Account.find_by(number: login_params[:number]).
        update_attributes(login_attempts: Account.find_by(number: login_params[:number]).login_attempts + 1)
      render json: { error: 'pin code is invalid',
                     attempts_left: 3 - Account.find_by(number: login_params[:number]).login_attempts }.to_json, status: 404
    else
      Account.find_by(number: login_params[:number]).update_attributes(login_attempts: 0)
      render json: { token: JWT.encode(login_params.to_json, nil, 'none') }
    end
  end

  def balance
    if @account.present? && @account.name.include?('Current account')
      render json: { account: { id: @account.id, name: @account.name, balance: @account.balance, debit: @account.debit,
                                credit: @account.credit } }
    else
      render json: {}, status: 401
    end
  end

  def credit_withdraw
    if @account.present? && @account.name.include?('Current account') && @account.credit?
      @transactions, @errors = ATMService.credit_withdraw(credit_action_params[:amount], @account)
      if @errors.empty?
        render json: { transactions: @transactions }
      else
        render json: { errors: @errors }, status: 400
      end
    else
      render json: {}, status: 401
    end
  end

  def credit_payment
    if @account.present? && @account.name.include?('Current account') && @account.credit?
      @transactions, @errors, @messages = ATMService.credit_payment(credit_action_params[:amount], @account)
      if @errors.empty?
        render json: { transactions: @transactions, messages: @messages }
      else
        render json: { errors: @errors }, status: 400
      end
    else
      render json: {}, status: 401
    end
  end

  def deposit_withdraw
    if @account.present? && @account.name.include?('Current account') && @account.deposit?
      @transactions, @errors = ATMService.deposit_withdraw(credit_action_params[:amount], @account)
      if @errors.empty?
        render json: { transactions: @transactions }
      else
        render json: { errors: @errors }, status: 400
      end
    else
      render json: {}, status: 401
    end
  end

  private

  def find_account
    @account = Account.find_by(JSON.parse(JWT.decode(request.headers[:token], nil, false).first))
  end

  def credit_action_params
    params.require(:atm).permit(:amount)
  end

  def login_params
    params.require(:login).permit(:number, :pin)
  end
end
