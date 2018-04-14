class SessionsController < ApplicationController
  def create
    begin
      @user = User.from_omniauth(request.env['omniauth.auth'])
      session[:user_uuid] = @user.uuid
      flash[:success] = "Welcome, #{@user.nick}!"
    rescue StandardError
      flash[:warning] = 'There was an error while trying to authenticate you...'
    end
    redirect_to root_path
  end

  def destroy
    if current_user
      session.delete(:user_uuid)
      flash[:success] = 'See you!'
    end
    redirect_to root_path
  end
end
