class User < ActiveRecord::Base
  VALID_USERS = %w{david.padilla@crowdint.com}
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  #devise :database_authenticatable, :registerable,
         #:recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  devise :omniauthable

  validates :email, inclusion: { in: VALID_USERS }

end
