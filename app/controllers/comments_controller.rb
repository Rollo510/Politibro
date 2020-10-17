class CommentsController < ApplicationController
    before_action :set_comment_meme, only: [:new, :create, :edit, :update, :destroy]


    def new
        @comment = Comment.new   
    end

    def create
        if params[:meme_id]
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
        @comment = @meme.comments.find_by(id: params[:id])
    end

    def update
        @comment = @meme.comments.find_by(id: params[:id])
        @comment.update(comment_params)
        if @comment.save
            redirect_to @meme
        else
            flash[:notice] = "Just delete your comment if you're going to leave it blank."
            redirect_to edit_comment_path(@comment, meme_id: @meme.id)
        end
    end

    def destroy
        @comment = Comment.find_by(id: params[:id])
        @comment.destroy
        if @comment.destroy
            redirect_to @meme
        else
            flash[:notice] = "Could not delete that comment. Sorry."
            redirect_to meme_path(@meme.id)
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:content, :meme_id, :user_id)
    end

    def set_comment_meme
        @meme = Meme.find_by(id: params[:meme_id])
    end

end
