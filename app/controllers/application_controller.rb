class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate_app
    redirect_to :root unless !current_user.nil?
  end

  def authenticate_admin
    redirect_to :root unless !current_user.nil? and current_user.role == "admin"
  end

  def log (text)
  	p "-------------------------------"
  	p text
  	p "==============================="
  end
end
