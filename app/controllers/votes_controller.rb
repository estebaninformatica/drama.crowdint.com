class VotesController < ApplicationController
  def create
    @drama = Drama.find params[:submission_id]
    vote = @drama.votes.build
    vote.voter = current_user
    vote.save!

    redirect_to :submissions
  end
end
