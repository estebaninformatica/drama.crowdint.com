class VotesController < ApplicationController
  respond_to :json

  def create
    @drama = Drama.find params[:submission_id]
    @drama.upvote_by current_user

    respond_with @drama, location: submissions_url
  end
end
