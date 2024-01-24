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
  
    private
  
    def set_client
      @client = Client.find(params[:id])
    end
  
    def client_params
      params.require(:client).permit(:first_name, :last_name, :first_enrolled, :street, :city, :state, :zip, :census_tract, :qoz, :date_of_birth, :marital_status, :monthly_salary, :referring_partner, :county_work, :county_residence, :employer, :email, :phone_number, :employer, :job_title)
    end
  end
  