class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate

  def authenticate
    redirect_to user_omniauth_authorize_path :google_apps unless current_user
  end
end
