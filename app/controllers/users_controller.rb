class UsersController < ApplicationController

  def index
    @memes = current_user.memes.all
  end

end
