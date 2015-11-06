class Trip < ActiveRecord::Base
   belongs_to :user
   has_many :guests
  # has_many :activities
end
