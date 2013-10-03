class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      flash[:notice] = "Your comment has been posted for all to see!"
      # binding.pry
      redirect_to @comment.post
    else
      render :new
    end
  end

private
  def comment_params
    params.require(:comment).permit(:content, :commentable_type, :commentable_id)
  end
end