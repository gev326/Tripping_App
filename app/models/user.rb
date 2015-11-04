class User < ActiveRecord::Base
  has_one :trip
  has_secure_password

  validates :email, presence: true, uniqueness: true

end
