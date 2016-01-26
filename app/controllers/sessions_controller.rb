class SessionsController < ApplicationController

	skip_before_filter :authenticate_user!

  def create
    session[:user_id] = params[:user_id]

    redirect_to root_url
  end

end