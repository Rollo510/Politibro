class UsersController < ApplicationController

  def index
    @memes = Meme.where(user_id: current_user.id)
  end

end
