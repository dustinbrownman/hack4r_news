class PostsController < ApplicationController
  before_filter :logged_in_check, :except => [:index, :show]

  def index
    @posts = Post.sort_by_votes
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:notice] = "Post saved!"
      redirect_to @post
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new(:user_id => current_user.id, :commentable_id => @post.id, :commentable_type => 'Post') if current_user
  end

private

  def post_params
    params.require(:post).permit(:title, :url)
  end

  def logged_in_check
    redirect_to login_path, alert: 'You must be logged in to do that' if current_user.nil?
  end
end
