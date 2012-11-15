class SubscriptionsController < ApplicationController
  def edit
  end

  def update
    current_user.update_attribute :subscribed, params[:subscribed]
  end

  def show
    render :json => {:subscribed => current_user.subscribed}
  end
end
