class SessionController < ApplicationController
  def create
    auth = request.env['omniauth.auth']

    user = User.find_by(provider: auth['provider'], uid: auth['uid']) || User.from_omniauth(auth)
    # user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
