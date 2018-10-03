class ClientsController < BaseController
  before_action :set_client, only: %i[show update destroy]

  # GET /clients
  def index
    @clients = Client.all
    render json: @clients
  end

  # GET /clients/1
  def show
    render json: @client
  end

  # POST /clients
  def create
    @client = Client.create(client_params)
    create_or_update_response
  end

  # PATCH/PUT /clients/1
  def update
    @client.update(client_params)
    create_or_update_response
  end

  # DELETE /clients/1
  def destroy
    @client.destroy
    render json: @client
  end

  private

  def set_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:surname, :name, :patronymic, :birthdate, :sex,
                                   :passport_series, :passport_number, :place_of_issue,
                                   :date_of_issue, :id_number, :birth_place, :address,
                                   :civil_status, :country, :disability, :retirement,
                                   :military, :home_phone, :mobile_phone, :email,
                                   :disabled, :retired, :salary, :city_id,
                                   :civil_status_id, :disability_id, :country_id)
  end

  def create_or_update_response
    if @client.valid?
      render json: @client
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end
end
