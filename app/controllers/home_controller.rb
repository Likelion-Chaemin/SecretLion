class HomeController < ApplicationController
  layout "layout"
    def index
      @questions = Question.all
    end

    def write
      @question = Question.new
      @question.user_id = current_user.id
      @question.title = params[:question]
      @question.description = params[:description]
      @question.save
    end
end
