class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :url, presence: true, url: true

  belongs_to :user
  has_many :votes, :dependent => :destroy
  has_many :comments, :as => :commentable

  def self.sort_by_votes
    all.sort { |post_a, post_b| post_b.calculate_score <=> post_a.calculate_score }
  end

  def calculate_score
    minutes_since_post = (Time.now - self.created_at.to_time) / 60
    percent_of_day = (200 - minutes_since_post) / 200
    self.votes.count * percent_of_day
  end
end
