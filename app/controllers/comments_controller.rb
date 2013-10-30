class CommentsController < ApplicationController
  def new
    @comment = Comment.new(comment_params) if current_user
  end

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      respond_to do |format|
        format.html { redirect_to @comment.post }
        format.js
      end
    else
      redirect_to @comment.post, alert: 'something went wrong!'
    end
  end

private

  def comment_params
    params.require(:comment).permit(:content, :commentable_type, :commentable_id)
  end
end
