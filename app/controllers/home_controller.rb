class HomeController < ApplicationController

  layout "layout"
  before_action :authenticate_user!
    def index
			votes = Vote.all
      questions = Question.all
			@posts = votes + questions
			@posts = @posts.sort_by &:created_at
      @questions = Question.all
    end
    
    def create
      @question = Question.new
      @question.user_id = current_user.id
      @question.to_user_id = params[:toUserId]
      @question.title = params[:question]
      @question.description = params[:description]
      @question.save
      redirect_to root_path
    end

		def search
			keyword = params[:keyword]
			user = User.where(name: keyword)
			if user.count == 0
				@posts = nil 
			else 
				user_id = user.take.id
				qs = Question.where(user_id: user_id)
				vs = Vote.where(user_id: user_id)
				@posts = qs + vs
			end

			if @posts
				@posts = @posts + Question.where("title like ?", "%"+keyword+"%")
				@posts = @posts + Vote.where("title like ?", "%"+keyword+"%")
			else
				@posts = Question.where("title like ?", "%"+keyword+"%")
				@posts = @posts + Vote.where("title like ?", "%"+keyword+"%")
			end
		end


		def target
			@posts = current_user.target
		end

		def mine
			@posts = current_user.mine
		end

    def write
      @question = Question.new
      @users = User.all
    end

		def new_comment
				@q_id = params[:q_id]
        reply = Comment.new
        reply.user_id = current_user.id
        reply.question_id = @q_id
        reply.content = params[:reply]
        reply.save
				@comments = reply.question.comments
		end

		def comment_like
			cmt_id = params[:cmt_id]

			cmt = Comment.find(cmt_id)
			like = Commentlike.where(user_id:current_user.id).where(comment_id: cmt_id)
			if like.count > 0
				like.take.destroy
			else
				cmtlike = Commentlike.new
				cmtlike.user_id = current_user.id
				cmtlike.comment_id = params[:cmt_id]
				cmtlike.save
			end
				render json: { likes: cmt.commentlikes.count }
		end

end
