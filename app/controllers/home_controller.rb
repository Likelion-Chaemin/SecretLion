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

end
