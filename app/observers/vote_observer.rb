class VoteObserver < ActiveRecord::Observer
  def after_save(vote)
    drama = vote.drama
    if drama.votes.count > 9
      days_without_drama = Drama.days_without_drama
      drama.add_drama_at
      drama.publish!

      Streak.create! days_without_drama: days_without_drama
    end
  end
end
