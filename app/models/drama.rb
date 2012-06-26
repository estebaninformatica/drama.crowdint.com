class Drama < ActiveRecord::Base
  attr_accessible :description
  belongs_to :creator, class_name: 'User'

  def self.days_without_drama
    last_drama = last.created_at || Time.now
    ((Time.now - last_drama) / 1.day).to_i
  end

  def self.all_ordered
    order('created_at DESC')
  end
end
