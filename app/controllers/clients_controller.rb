class ClientsController < ApplicationController
  include ActionController::MimeResponds
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token
  # GET /clients
  # GET /clients.json
  def index
    @clients = Client.all
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @clients }
    end
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @client }
    end
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
    respond_to do |format|
      format.html { render :edit }
      format.json { render json: @client }
    end
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: 'Client was successfully created.' }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: 'Client was successfully updated.' }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'Client was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:surname, :name, :patronymic, :birthdate, :sex,
                                     :passport_series, :passport_number, :place_of_issue,
                                     :date_of_issue, :id_number, :birth_place, :address,
                                     :civil_status, :country, :disability, :retirement,
                                     :military,:home_phone, :mobile_phone, :email,
                                     :disabled, :retired, :salary, :city_id)
    end
end
