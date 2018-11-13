class DepositsController < ApplicationController
  before_action :set_deposit, only: %i[show update destroy]

  # GET /deposits
  def index
    @deposits = Deposit.includes(:currency, :deposit_type).all
    render json: @deposits
  end

  # GET /deposits/1
  def show
    render json: @deposit
  end

  # POST /deposits
  def create
    @deposit = Deposit.create(deposit_params)
    create_or_update_response
  end

  # PATCH/PUT /deposits/1
  def update
    @deposit.update(deposit_params)
    create_or_update_response
  end

  # DELETE /deposits/1
  def destroy
    @deposit.destroy
    render json: @deposit
  rescue ActiveRecord::InvalidForeignKey => e
    render_error(:unprocessable_entity, e.inspect)
  end

  private

  def set_deposit
    @deposit = Deposit.includes(:currency, :deposit_type).find(params[:id])
  end

  def deposit_params
    params.require(:deposit).permit(:deposit_type_id, :currency_id, :duration, :percent)
  end

  def create_or_update_response
    if @deposit.valid?
      render json: @deposit
    else
      render json: @deposit.errors, status: :unprocessable_entity
    end
  end
end
