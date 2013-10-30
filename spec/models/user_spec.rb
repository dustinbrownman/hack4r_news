require 'spec_helper'

describe User do
  it 'validates uniqueness of email' do
    User.create(:password => 'things', :password_confirmation => 'things', :email => 'things')
    should validate_uniqueness_of :email
  end
  it { should have_many :posts }
  it { should have_many :comments }
  it { should validate_presence_of :email }
  it { should have_secure_password }

  it "should validate a proper url" do 
    post = Post.new(title: "hi", url: "http://www.google.com")
    post.should be_valid
  end

  it "should not validate a improper url" do 
    post = Post.new(title: "hello", url: "google.com")
    post.should_not be_valid
  end
end
