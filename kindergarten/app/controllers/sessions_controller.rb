class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to root_url
    end
  end
  
  def create
    user = User.find_by(login: params[:session][:login].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      redirect_to root_url
    else
      flash.now[:danger] = "Niepoprawny login i/lub hasło. Spróbuj ponownie."
      render "new"
    end
  end
  
  def destroy
    log_out
    redirect_to root_url
  end
end