class CurrenciesController < ApplicationController
  before_action :set_currency, only: %i[show update destroy]

  # GET /currencies
  def index
    @currencies = Currency.all
    render json: @currencies
  end

  # GET /currencies/1
  def show
    render json: @currency
  end

  # POST /currencies
  def create
    @currency = Currency.create(currency_params)
    create_or_update_response
  end

  # PATCH/PUT /currencies/1
  def update
    @currency.update(currency_params)
    create_or_update_response
  end

  # DELETE /currencies/1
  def destroy
    @currency.destroy
    render json: @currency
  rescue ActiveRecord::InvalidForeignKey => e
    render_error(:unprocessable_entity, e.inspect)
  end

  private

  def set_currency
    @currency = Currency.find(params[:id])
  end

  def currency_params
    params.require(:currency).permit(:name, :code)
  end

  def create_or_update_response
    if @currency.valid?
      render json: @currency
    else
      render json: @currency.errors, status: :unprocessable_entity
    end
  end
end
