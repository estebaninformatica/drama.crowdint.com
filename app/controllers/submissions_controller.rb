class SubmissionsController < ApplicationController
  def new
    @drama = Drama.new
  end

  def create
    @drama         = Drama.new params[:drama]
    @drama.creator = current_user
    if @drama.save
      redirect_to :submissions
    else
      render action: 'new'
    end
  end

  def index
    @dramas = Drama.ordered_by_created_at.submitted
  end
end
