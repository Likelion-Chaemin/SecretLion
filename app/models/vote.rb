class Vote < ActiveRecord::Base
  belongs_to :user
	has_many :photos
	has_many :photolikes
  has_many :target_users, through: :photo, source: :user
	has_many :voters, through: :photolikes, source: :user

	def hasAnswered(user_id)
		voters.where(id: user_id).count > 0
	end
end
