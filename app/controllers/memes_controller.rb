class MemesController < ApplicationController
    before_action :set_meme, only: [:show, :edit, :update, :destroy]
    

    def index
        @memes = Meme.all
    end

    def safe_for_work
        @memes = Meme.all.safe_for_work
        render :index
    end

    def new
        @meme = Meme.new
    end

    def create
        @meme = Meme.create(title: params[:meme][:title], description: params[:meme][:description], nsfw: params[:meme][:nsfw], user_id: current_user.id)
        if @meme.save
            redirect_to @meme
        else
            flash[:notice] = @meme.errors.full_messages.to_sentence
            render :new
        end
    end

    def edit
    end

    def show
        @comment = Comment.new
        if @meme
            render :show
        else
            flash[:notice] = "Meme not found"
            redirect_to memes_path
        end
    end

    def destroy
        if @meme.user_id == current_user.id && @meme.destroy
            redirect_to memes_path
        else
            flash[:notice] = "Could not delete that meme. Sorry."
            redirect_to @meme
        end
    end

    private

    def set_meme
        @meme = Meme.find_by(id: params[:id])
    end

    def meme_params
        params.require(:meme).permit(:title, :nsfw, :user_id, :description)
    end

end
