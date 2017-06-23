class Question < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :commenters, through: :comments, source: :user

	def hasAnswered(user_id)
		commenters.where(id: user_id).count > 0
	end
end
