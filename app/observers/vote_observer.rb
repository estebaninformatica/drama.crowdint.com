class VoteObserver < ActiveRecord::Observer
  def after_save(vote)
    drama = vote.drama
    if drama.votes.count > 9
      drama.add_drama_at
      drama.publish!
    end
  end
end
