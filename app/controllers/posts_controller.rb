class PostsController < ApplicationController
  def index
    @posts = Post.all
  end


  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_back fallback_location: :posts
    else
      flash[:notice] = "Something wrong happening... Try again later."
      redirect_to :back
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    end
  end

  private

  def post_params
      params.require(:post).permit(:body)
  end
end
