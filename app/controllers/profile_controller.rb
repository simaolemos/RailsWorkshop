class ProfileController < ApplicationController

  before_action :setUser

  def index

    @post = current_user.posts.new
    @posts = @user.posts

  end

  private

  def setUser
    @user = User.find_by({ username: params[:username] })
  end

end
