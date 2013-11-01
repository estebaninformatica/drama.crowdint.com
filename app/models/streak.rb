class Streak < ActiveRecord::Base
  attr_accessible :days_without_drama

  def self.best_streak
    streak = Streak.ordered_by_days_without_drama_desc.first
    longest_streak = streak ? streak.days_without_drama : 0
    last_drama = Drama.days_without_drama
    [longest_streak, last_drama].max
  end

  def self.ordered_by_days_without_drama_desc
    order('days_without_drama DESC')
  end
end
