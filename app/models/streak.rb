class Streak < ActiveRecord::Base
  attr_accessible :days_without_drama

  def self.best_streak
    streak = Streak.ordered_by_days_without_drama_desc.first
    streak ? streak.days_without_drama : 0
  end

  def self.ordered_by_days_without_drama_desc
    order('days_without_drama DESC')
  end
end
