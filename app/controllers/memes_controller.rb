class MemesController < ApplicationController

    before_action :set_meme, only: [:show, :edit, :update, :destroy]
    

    def index
        
    end




    



    private

    def set_meme
        @meme = Meme.find_by(id: params[:id])
    end

    def sushi_params
        
    end

end
