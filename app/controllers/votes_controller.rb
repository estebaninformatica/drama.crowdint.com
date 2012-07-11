class VotesController < ApplicationController
  def create
    @drama = Drama.find params[:submission_id]
    @drama.upvote_by current_user

    redirect_to :submissions
  end
end
