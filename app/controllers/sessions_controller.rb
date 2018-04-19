class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.from_omniauth(request.env["omniauth.auth"])

    if user.valid?
      session[:user_id] = user.id
      # session[:token] = user.oauth_token

      redirect_to request.env['omniauth.origin']
      # render 'layouts/dummy'
    end
  end

  def destroy
  	reset_session
    redirect_to root_path
  end
end
