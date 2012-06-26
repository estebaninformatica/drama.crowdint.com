class Drama < ActiveRecord::Base
  attr_accessible :description
  belongs_to :creator, class_name: 'User'

end
