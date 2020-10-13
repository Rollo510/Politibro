class MemesController < ApplicationController
    before_action :set_meme, only: [:show, :edit, :update, :destroy]
    

    def index
        @memes = Meme.all
        @memes.order(created_at: :desc)
    end

    def new
       @meme = Meme.new(meme_params)
    end

    def create
        @meme = Meme.new(meme_params)
        if @meme.save
            redirect_to @meme
        else
            flash[:notice] = @meme.errors.full_messages.to_sentence
            render :new
        end
    end
    



    



    private

    def set_meme
        @meme = Meme.find_by(id: params[:id])
    end

    def meme_params
        params.require(:meme).permit(:title, :nsfw, :description, comments_attributes:[:user_id, :meme_id, :posted_at, :comment])
    end

end
