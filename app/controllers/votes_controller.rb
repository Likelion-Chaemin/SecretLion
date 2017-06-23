class VotesController < ApplicationController
	def create
		targets = params[:target_user]
		if !targets || targets.count <= 1 
			redirect_to :back
			return
		end
		vote = Vote.new
		vote.user_id = current_user.id
		vote.title = params[:title]
#		vote.description = 
		vote.save
		for t in targets
			p = Photo.new
			p.vote_id = vote.id
			p.photo_user_id = t
			p.save
		end
		redirect_to '/home/index'
	end

	def photolike
		photo = Photo.find(params[:photo_id])
		vote = Vote.find(photo.vote_id)
		like = vote.photolikes.where(:user => current_user.id)
		cancelled = false
		moved = false
		if like.count > 0
			former = like.first
			# 같은 투표에 이미 like된 photo가 있는 경우 
			former_photo = Photo.find(former.photo_id)
			former.destroy
			if former_photo == photo
				cancelled = true
				# 지금 누른 게 예전에 like했던 photo면 like 취소하고 끝
			end
			moved = true
			# 아니면 다른 거 like
		end

		if !cancelled
			# like하는 부분
			new_like = Photolike.new
			new_like.vote_id = photo.vote_id
			new_like.user_id = current_user.id
			new_like.photo_id = photo.id
			new_like.save
		end

		if cancelled
			render json: { cancelled: true, votes: photo.photolikes.count, width: photo.width }
		elsif moved
			render json: { cancelled: false, moved: true, former_id: former_photo.id,
									former_votes: former_photo.photolikes.count, former_width: former_photo.width,
									votes: photo.photolikes.count, width: photo.width }
		else
			render json: { cancelled: false, moved: false,
									votes: photo.photolikes.count, width: photo.width }
		end
	end
end
