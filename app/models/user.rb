class User < ActiveRecord::Base
  has_many :posts
  has_many :votes
  has_many :comments
  validates :email, presence: true, uniqueness: true

  has_secure_password
end
