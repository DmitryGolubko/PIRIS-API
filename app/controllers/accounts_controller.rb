class AccountsController < BaseController
  before_action :set_account, only: %i[show]

  # GET /accounts
  def index
    @accounts = Account.all
    render json: @accounts
  end

  # GET /accounts/1
  def show
    render json: @account
  end

  private

  def set_account
    @account = Account.find(params[:id])
  end
end
