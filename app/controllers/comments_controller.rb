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
            flash[:notice] = "Your comment can't be blank."
            redirect_to new_meme_comment_path
        end
    end

    def edit
    end

    def update
        @meme.update(meme_params)
        if @meme.errors.empty?
            redirect_to @meme
        else
            flash[:notice] = @meme.errors.full_messages.join(" ")
            redirect_to edit_meme_path(@meme)
        end
    end

    def destroy
        if @meme.destroy
            redirect_to memes_path
        else
            flash[:notice] = "Could not delete that meme. Sorry."
            redirect_to @meme
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:content, :meme_id, :user_id)
    end

end
