class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :url, presence: true, url: true

  belongs_to :user
  has_many :votes, :dependent => :destroy
end