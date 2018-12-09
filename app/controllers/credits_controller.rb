class CreditsController < BaseController
  before_action :set_credit, only: %i[show update destroy]

  # GET /credits
  def index
    @credits = Credit.includes(:currency, :credit_type).all
    render json: @credits
  end

  # GET /credits/1
  def show
    render json: @credit
  end

  # POST /credits
  def create
    @credit = Credit.create(credit_params)
    create_or_update_response
  end

  # PATCH/PUT /credits/1
  def update
    @credit.update(credit_params)
    create_or_update_response
  end

  # DELETE /credits/1
  def destroy
    @credit.destroy
    render json: @credit
  rescue ActiveRecord::InvalidForeignKey => e
    render_error(:unprocessable_entity, e.inspect)
  end

  private

  def set_credit
    @credit = Credit.includes(:currency, :credit_type).find(params[:id])
  end

  def credit_params
    params.require(:credit).permit(:credit_type_id, :currency_id, :duration, :percent, :max_amount)
  end

  def create_or_update_response
    if @credit.valid?
      render json: @credit
    else
      render json: @credit.errors, status: :unprocessable_entity
    end
  end
end
