class MemesController < ApplicationController
    before_action :set_meme, only: [:show, :edit, :update, :destroy]
    

    def index
        @memes = Meme.all
        @memes.newest_memes
    end

    def new
        @meme = Meme.new
    end

    def create
        @meme = Meme.create(meme_params)
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

    def set_meme
        @meme = Meme.find_by(id: params[:id])
    end

    def meme_params
        params.require(:meme).permit(:title, :nsfw, :description)
    end

end
