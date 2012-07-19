class Drama < ActiveRecord::Base
  attr_accessible :description
  belongs_to :creator, class_name: 'User'

  has_many :votes
  has_many :voters, :through => :votes

  state_machine initial: :submitted do
    event :publish do
      transition :submitted => :published
    end
  end

  delegate :email, to: :creator

  def can_vote?(user)
    (self.creator != user) && (!voters.include?(user))
  end

  def upvote_by(user)
    vote = self.votes.build
    vote.voter = user
    vote.save!
  end

  def self.submitted
    with_state :submitted
  end

  def self.published
    with_state :published
  end

  def self.days_without_drama(last_drama = Drama.all_ordered_and_published.first)
    last_drama_date = (last_drama ? last_drama.drama_at : Time.zone.now)
    ((Time.zone.now - last_drama_date) / 1.day).to_i
  end

  def self.all_ordered
    order('drama_at DESC')
  end

  def self.ordered_by_created_at
    order('created_at DESC').includes(:creator, :votes => :voter)
  end

  def self.all_ordered_and_published
    all_ordered.published
  end

  def add_drama_at
    self.drama_at ||= Time.zone.now
  end
end
