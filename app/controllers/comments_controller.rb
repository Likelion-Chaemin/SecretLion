class CommentsController < ApplicationController
    
    before_action :authenticate_user!
    
    def index
        @comments = Comment.all
    end
    
    def create
    end
    
end
