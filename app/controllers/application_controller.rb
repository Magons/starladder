class ApplicationController < ActionController::Base
  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find_by(uuid: session[:user_uuid]) if session[:user_uuid]
  end
end
