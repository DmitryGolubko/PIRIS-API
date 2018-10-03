class DisabilitiesController < BaseController
  before_action :set_disability, only: %i[show update destroy]

  # GET /disabilities
  def index
    @disabilities = Disability.all
    render json: @disabilities
  end

  # GET /disabilities/1
  def show
    render json: @disability
  end

  # POST /disabilities
  def create
    @disability = Disability.create(disability_params)
    create_or_update_response
  end

  # PATCH/PUT /disabilities/1
  def update
    @disability.update(disability_params)
    create_or_update_response
  end

  # DELETE /disabilities/1
  def destroy
    @disability.destroy
    render json: @disability
  rescue ActiveRecord::InvalidForeignKey => e
    render_error(:unprocessable_entity, "Can't delete disability, please delete users before.")
  end

  private

  def set_disability
    @disability = Disability.find(params[:id])
  end

  def disability_params
    params.require(:disability).permit(:name)
  end

  def create_or_update_response
    if @disability.valid?
      render json: @disability
    else
      render json: @disability.errors, status: :unprocessable_entity
    end
  end
end
