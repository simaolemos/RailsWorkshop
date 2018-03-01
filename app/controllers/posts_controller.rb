class PostsController < ApplicationController
  def index
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_back
    else
      flash[:notice] = "Something wrong happening... Try again later."
      redirect_to :back
    end
  end

  private

  def post_params
      params.require(:post).permit(:body)
  end
end
