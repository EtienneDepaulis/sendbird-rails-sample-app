class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :user_signed_in?

  before_action :authenticate_user!

  private

    def current_user
      @current_user ||= User.find session[:user_id] if session[:user_id]
    end

    def user_signed_in?
      current_user
    end

    def authenticate_user!
      unless user_signed_in?
        self.response_body = nil
        redirect_to not_signed_in_url
      end
    end
end
