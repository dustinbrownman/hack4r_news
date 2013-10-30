class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :comments, :as => :commentable
  validates_presence_of :content

  def post 
    commentable.is_a?(Post) ? commentable : commentable.post
  end
end
