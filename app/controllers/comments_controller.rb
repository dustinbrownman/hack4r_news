class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:notice] = "Your comment has been posted for all to see!"
      redirect_to @comment.post
    else
      render :new
    end
  end

private
  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end
end