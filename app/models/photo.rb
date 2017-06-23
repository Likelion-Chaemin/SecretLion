class Photo < ActiveRecord::Base
  belongs_to :vote
	belongs_to :target, class_name: 'User', foreign_key: :photo_user_id

  has_many :photolikes
  has_many :photo_likers, through: :photolikes, source: :user

	def width
		max = 0
		for p in vote.photos
			cnt = p.photolikes.count
			if cnt > max
				max = cnt
			end
		end
		if max == 0
			0
		else
			photolikes.count * 100 / max * 0.9 # 0.9 for the margin of the label 'n표'
		end
	end

	def hasChosen(user_id)
		photo_likers.where(id: user_id).count > 0
	end
end
