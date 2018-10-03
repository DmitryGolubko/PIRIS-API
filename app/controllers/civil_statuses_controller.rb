class CivilStatusesController < BaseController
  before_action :set_civil_status, only: %i[show update destroy]

  # GET /civil_statuses
  def index
    @civil_statuses = CivilStatus.all
    render json: @civil_statuses
  end

  # GET /civil_statuses/1
  def show
    render json: @civil_status
  end

  # POST /civil_statuses
  def create
    @civil_status = CivilStatus.create(civil_status_params)
    create_or_update_response
  end

  # PATCH/PUT /civil_statuses/1
  def update
    @civil_status.update(civil_status_params)
    create_or_update_response
  end

  # DELETE /civil_statuses/1
  def destroy
    @civil_status.destroy
    render json: @civil_status
  rescue ActiveRecord::InvalidForeignKey => e
    render_error(:unprocessable_entity, "Can't delete civil_status, please delete users before.")
  end

  private

  def set_civil_status
    @civil_status = CivilStatus.find(params[:id])
  end

  def civil_status_params
    params.require(:civil_status).permit(:name)
  end

  def create_or_update_response
    if @civil_status.valid?
      render json: @civil_status
    else
      render json: @civil_status.errors, status: :unprocessable_entity
    end
  end
end
