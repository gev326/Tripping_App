class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :guests, dependent: :destroy
  has_many :activities
end
