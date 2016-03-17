class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def current_user
  	@current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def authenticate_user!
  	user_signed_in? || access_denied
  end

  def user_signed_in?
  	current_user.is_a? User
  end

  helper_method :user_signed_in?

  def access_denied
  	redirect_to login_path, alert: "To do this action, you have to login first" and return false
  end

end
