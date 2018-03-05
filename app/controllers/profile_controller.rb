class ProfileController < ApplicationController

  def index
    if(current_user?)
      user = User.find(current_user.id)
    end
    
    @post = Post.new
    @posts = user.posts

  end

end
