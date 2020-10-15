class CommentsController < ApplicationController

    def new
        @comment = Comment.new(user_id: params[:user_id])   
    end

    def create
        comment = Comment.create(comment_params)
        redirect_to 
    end




    private

    def comment_params
        params.require(:comment).permit(:content, :meme_id, :user_id)
    end

end
