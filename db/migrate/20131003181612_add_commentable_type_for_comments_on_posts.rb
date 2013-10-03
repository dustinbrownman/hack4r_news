class AddCommentableTypeForCommentsOnPosts < ActiveRecord::Migration
  def change
    Comment.all.each do |comment|
      comment.update(commentable_type: 'post')
    end
  end
end
