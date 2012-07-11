class Drama < ActiveRecord::Base
  attr_accessible :description
  belongs_to :creator, class_name: 'User'

  has_many :votes

  state_machine initial: 'submitted'

  def can_vote?(user)
    (self.creator != user) && (votes.select {|v| v.voter == user}.empty?)
  end

  def self.submitted
    with_state :submitted
  end

  def self.days_without_drama
    last_drama = last
    last_drama_date = (last_drama ? last_drama.drama_at : Time.zone.now)
    ((Time.zone.now - last_drama_date) / 1.day).to_i
  end

  def self.all_ordered
    order('drama_at DESC')
  end

  def add_drama_at
    self.drama_at ||= Time.zone.now
  end
end
