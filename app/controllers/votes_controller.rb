class VotesController < ApplicationController
	def create
		targets = params[:target_user]
		if !targets || targets.count <= 1 
			redirect_to :back
			return
		end
		vote = Vote.new
		vote.user_id = current_user.id
		vote.save
		for t in targets
			vr = VoteRecord.new
			vr.vote_id = vote.id
			vr.user_id = t
			vr.save
		end
		redirect_to '/home/index'
	end
end
