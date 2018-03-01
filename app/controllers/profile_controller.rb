class ProfileController < ApplicationController

  def index
    user = User.find(current_user.id)

    @post = Post.new
    @posts = user.posts
  end

end
