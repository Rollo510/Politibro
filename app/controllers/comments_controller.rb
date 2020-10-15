class CommentsController < ApplicationController

    def new
        @comment = Comment.new(user_id: params[:user_id])   
    end

    def create
        if params[:meme_id] && current_user.id
            @meme = Meme.find_by_id(params[:meme_id])
            @comment = @meme.comments.build(comment_params)
        else 
            @comment = Comment.new(comment_params)
        end
        if @comment.save
            redirect_to @meme
        else
            render :new, alert: "Could not create that for you!"
        end
    end




    private

    def comment_params
        params.require(:comment).permit(:content, :meme_id, :user_id)
    end

end
