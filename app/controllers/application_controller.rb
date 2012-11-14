class ApplicationController < ActionController::Base
  protect_from_forgery

  prepend_before_filter :api_key
  before_filter :authenticate, :calculate_streak, :determine_request_source

  def authenticate
    redirect_to user_omniauth_authorize_path :google_apps unless current_user
  end

  def calculate_streak
    @streak = Streak.best_streak
  end

  def determine_request_source
    if request.env['HTTP_X_APP_SOURCE']
      session[:request_source] = request.env['HTTP_X_APP_SOURCE']
    end
  end

  def api_key
    if api_key = params[:token].blank? && request.headers["X-AUTH-TOKEN"]
      params[:token] = api_key
    end
  end

  def iphone?
    session[:request_source] == 'IPHONE'
  end
end
