class Photo < ActiveRecord::Base
  belongs_to :vote
  has_many :photolikes
  has_many :photo_likers, through: :photolikes, source: :user
end
