class User < ActiveRecord::Base
  has_many :trips
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 4 }
  validates :phone, length: { minimum: 10 }

end
