class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate, :calculate_streak

  def authenticate
    redirect_to user_omniauth_authorize_path :google_apps unless current_user
  end

  def calculate_streak
    @streak = Streak.best_streak
  end
end
