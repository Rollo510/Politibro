class CommentsController < ApplicationController

    def new
        @comment = Comment.new   
        @meme = Meme.find_by(id: params[:meme_id])
    end

    def create
        if params[:meme_id]
            @meme = Meme.find_by_id(params[:meme_id])
            @comment = @meme.comments.build(content: params[:comment][:content], user_id: current_user.id)
        else 
            @comment = Comment.new(comment_params)
        end
        if @comment.save
            redirect_to @meme
        else
            render :new, alert: "Your comment couldn't post. Sorry."
        end
    end

    


    private

    def comment_params
        params.require(:comment).permit(:content, :meme_id, :user_id)
    end

end
