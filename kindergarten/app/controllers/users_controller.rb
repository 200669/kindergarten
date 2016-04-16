class UsersController < ApplicationController
  before_action :logged_in_admin
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def index
    @users = User.all
  end
  
  def show
  end
  
  def new
    @user = User.new
  end
  
  def edit
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:info] = "Pracownik dodany pomyślnie"
      redirect_to @user
    else
      render :new
    end
  end
  
  def update
    if @user.update(user_params)
      flash[:info] = "Dane pracownika zapisane"
      redirect_to @user
    else
      render :edit
    end
  end
  
  def destroy
    @user.destroy
    flash[:info] = "Dane pracownika usunięte"
    redirect_to users_url
  end
  
  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:login, :name, :lastname, :password, :password_confirmation)
    end
  
    def logged_in_admin
      redirect_to root_url unless admin?
    end
end
