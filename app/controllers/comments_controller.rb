class CommentsController < ApplicationController
    
    before_action :authenticate_user!
    
    def index
        @comments = Comment.all
    end
    
    def create
        @reply = Comment.new
        @reply.user_id = current_user.id
        @reply.question_id = params[:q_id]
        @reply.content = params[:reply]
        @reply.save
        redirect_to root_path
    end
    
end
