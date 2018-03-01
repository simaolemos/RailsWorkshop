class ProfileController < ApplicationController

  def index
    user = User.find(current_user.id)
    @posts = user.posts
  end

end
