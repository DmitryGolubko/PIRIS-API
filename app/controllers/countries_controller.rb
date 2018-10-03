class CountriesController < BaseController
  before_action :set_country, only: %i[show update destroy]

  # GET /countries
  def index
    @countries = Country.all
    render json: @countries
  end

  # GET /countries/1
  def show
    render json: @country
  end

  # POST /countries
  def create
    @country = Country.create(country_params)
    create_or_update_response
  end

  # PATCH/PUT /countries/1
  def update
    @country.update(country_params)
    create_or_update_response
  end

  # DELETE /countries/1
  def destroy
    @country.destroy
    render json: @country
  rescue ActiveRecord::InvalidForeignKey => e
    render_error(:unprocessable_entity, "Can't delete country, please delete users before.")
  end

  private

  def set_country
    @country = Country.find(params[:id])
  end

  def country_params
    params.require(:country).permit(:name)
  end

  def create_or_update_response
    if @country.valid?
      render json: @country
    else
      render json: @country.errors, status: :unprocessable_entity
    end
  end
end
