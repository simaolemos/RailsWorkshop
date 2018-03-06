class TimelineController < ApplicationController

  before_action :setUser

  def index
    @posts = @user.timeline_posts
  end

  private
  def setUser
    @user = current_user
  end
end
