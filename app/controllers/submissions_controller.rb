require 'email_notifier'

class SubmissionsController < ApplicationController
  respond_to :json, :html

  def new
    @drama = Drama.new
  end

  def create
    @drama         = Drama.new params[:drama]
    @drama.creator = current_user
    if @drama.save
      EmailNotifier.drama_created @drama
      #redirect_to :submissions
      respond_with @drama, :location => :submissions
    else
      render action: 'new'
    end
  end

  def index
    @dramas = Drama.ordered_by_created_at.submitted.recent
  end
end
