class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  

  helper_method :current_user

  private
    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
    
    def login_require
      redirect_to login_url unless current_user
    end
end
