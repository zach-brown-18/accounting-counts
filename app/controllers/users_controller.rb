class UsersController < ApplicationController
    before_action :authenticate_admin!
    before_action :set_user, only: [:show, :edit, :update, :destroy]
  
    def index
      @users = User.all
    end
  
    def show
    end
  
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to users_path, notice: 'User was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @user.update(user_params)
        redirect_to users_path, notice: 'User was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @user.destroy
      redirect_to users_path, notice: 'User was successfully destroyed.'
    end
  
    private
  
    def set_user
      @user = User.find(params[:id])
    end
  
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :admin)
    end
  
    # def authenticate_admin!
    #   redirect_to root_path, alert: 'Access denied.' unless current_user&.admin?
    # end
  end
  