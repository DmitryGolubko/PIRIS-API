class CreditTypesController < ApplicationController
  before_action :set_credit_type, only: %i[show update destroy]

  # GET /credit_types
  def index
    @credit_types = CreditType.all
    render json: @credit_types
  end

  # GET /credit_types/1
  def show
    render json: @credit_type
  end

  # POST /credit_types
  def create
    @credit_type = CreditType.create(credit_type_params)
    create_or_update_response
  end

  # PATCH/PUT /credit_types/1
  def update
    @credit_type.update(credit_type_params)
    create_or_update_response
  end

  # DELETE /credit_types/1
  def destroy
    @credit_type.destroy
    render json: @credit_type
  rescue ActiveRecord::InvalidForeignKey => e
    render_error(:unprocessable_entity, e.inspect)
  end

  private

  def set_credit_type
    @credit_type = CreditType.find(params[:id])
  end

  def credit_type_params
    params.require(:credit_type).permit(:name, :pay_type)
  end

  def create_or_update_response
    if @credit_type.valid?
      render json: @credit_type
    else
      render json: @credit_type.errors, status: :unprocessable_entity
    end
  end
end
