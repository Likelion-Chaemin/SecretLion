class HomeController < ApplicationController

  layout "layout"
  before_action :authenticate_user!
    def index
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
