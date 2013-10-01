class PostsController < ApplicationController
  before_filter :logged_in_check, :except => [:index, :show]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:notice] = "Post saved!"
      render :show
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

private

  def post_params
    params.require(:post).permit(:title, :url)
  end

  def logged_in_check
    redirect_to login_path, alert: 'You must be logged in to do that' if current_user.nil?
  end
end