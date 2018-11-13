class DepositTypesController < ApplicationController
  before_action :set_deposit_type, only: %i[show update destroy]

  # GET /deposit_types
  def index
    @deposit_types = DepositType.all
    render json: @deposit_types
  end

  # GET /deposit_types/1
  def show
    render json: @deposit_type
  end

  # POST /deposit_types
  def create
    @deposit_type = DepositType.create(deposit_type_params)
    create_or_update_response
  end

  # PATCH/PUT /deposit_types/1
  def update
    @deposit_type.update(deposit_type_params)
    create_or_update_response
  end

  # DELETE /deposit_types/1
  def destroy
    @deposit_type.destroy
    render json: @deposit_type
  rescue ActiveRecord::InvalidForeignKey => e
    render_error(:unprocessable_entity, e.inspect)
  end

  private

  def set_deposit_type
    @deposit_type = DepositType.find(params[:id])
  end

  def deposit_type_params
    params.require(:deposit_type).permit(:name, :revocable)
  end

  def create_or_update_response
    if @deposit_type.valid?
      render json: @deposit_type
    else
      render json: @deposit_type.errors, status: :unprocessable_entity
    end
  end
end
