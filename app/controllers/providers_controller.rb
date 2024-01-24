class ProvidersController < ApplicationController
    before_action :set_provider, only: [:show, :edit, :update, :destroy]
  
    def index
      @providers = Provider.all
    end
  
    def show
    end
  
    def new
      @provider = Provider.new
    end
  
    def create
      @provider = Provider.new(provider_params)
      if @provider.save
        redirect_to providers_path, notice: 'Provider was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @provider.update(provider_params)
        redirect_to providers_path, notice: 'Provider was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @provider.destroy
      redirect_to providers_path, notice: 'Provider was successfully destroyed.'
    end
  
    private
  
    def set_provider
      @provider = Provider.find(params[:id])
    end
  
    def provider_params
      params.require(:provider).permit(:name, :street, :city, :state, :zip, :email, :phone_number, :primary_contact)
    end
  end
