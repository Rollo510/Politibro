class UsersController < ApplicationController

  def index
    @memes = current_user.memes.all.uniq
  end

end
