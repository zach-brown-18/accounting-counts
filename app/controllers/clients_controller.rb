class ClientsController < ApplicationController
    before_action :set_client, only: [:show, :edit, :update, :destroy]
  
    def index
      @clients = Client.all
    end
  
    def show
    end
  
    def new
      @client = Client.new
    end
  
    def create
      @client = Client.new(client_params)
      if @client.save
        redirect_to clients_path, notice: 'Client was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @client.update(client_params)
        redirect_to clients_path, notice: 'Client was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @client.destroy
      redirect_to clients_path, notice: 'Client was successfully destroyed.'
    end

    def search
      first_name = params[:full_name]&.split[0] unless params[:full_name]&.split.count < 1
      last_name = params[:full_name]&.split[1] unless params[:full_name]&.split.count < 2
      @client = Client.find_by(first_name: first_name, last_name: last_name)
      if @client
        redirect_to client_path(@client)
      else
        flash[:alert] = 'Client not found.'
        redirect_to clients_path
      end
    end

    def autocomplete
      first_name = params[:full_name]&.split[0] unless params[:full_name]&.split.count < 1
      last_name = params[:full_name]&.split[1] unless params[:full_name]&.split.count < 2

      clients = Client.where('lower(first_name) LIKE ? AND lower(last_name LIKE ?)', "%#{first_name.downcase}%", "%#{last_name&.downcase}%").limit(5)
  
      render json: clients.map { |client| { id: client.id, full_name: client.full_name } }
    end
  
    private
  
    def set_client
      @client = Client.find(params[:id])
    end
  
    def client_params
      params.require(:client).permit(:first_name, :last_name, :first_enrolled, :street, :city, :state, :zip, :census_tract, :qoz, :date_of_birth, :marital_status, :monthly_salary, :referring_partner, :county_work, :county_residence, :employer, :email, :phone_number, :employer, :job_title, :notes)
    end
  end
  