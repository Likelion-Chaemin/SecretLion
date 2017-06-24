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

    def write
      @question = Question.new
      @users = User.all
    end

end
