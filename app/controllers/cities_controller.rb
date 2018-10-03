class CitiesController < BaseController
  before_action :set_city, only: %i[show update destroy]

  # GET /cities
  def index
    @cities = City.all
    render json: @cities
  end

  # GET /cities/1
  def show
    render json: @city
  end

  # POST /cities
  def create
    @city = City.create(city_params)
    create_or_update_response
  end

  # PATCH/PUT /cities/1
  def update
    @city.update(city_params)
    create_or_update_response
  end

  # DELETE /cities/1
  def destroy
    @city.destroy
    render json: @city
  rescue ActiveRecord::InvalidForeignKey => e
    render_error(:unprocessable_entity, "Can't delete city, please delete users before.")
  end

  private

  def set_city
    @city = City.find(params[:id])
  end

  def city_params
    params.require(:city).permit(:name)
  end

  def create_or_update_response
    if @city.valid?
      render json: @city
    else
      render json: @city.errors, status: :unprocessable_entity
    end
  end
end
