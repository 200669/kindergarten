module SessionsHelper
  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end
  
  # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end
  
  # Returns true if the logged user is an admin
  # FIXME: Make it a user field, not some hardcoded magic
  def admin?
    logged_in? && current_user.login == "admin"
  end
  
  # Logs out the current user.
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  
  def check_logged_in
    redirect_to root_url unless logged_in?
  end
end
