require 'spec_helper'

describe Comment do
  it { should belong_to :user }
  it { should validate_presence_of :content }
  it { should have_many :comments }
  it { should belong_to :commentable }

  describe '#post' do 
    it "should return the parent post" do 
      @post = FactoryGirl.create(:post)
      @comment1 = @post.comments.create(content: 'comment1')
      @comment2 = @comment1.comments.create(content: 'comment2')
      expect(@comment2.post).to eq @post
    end
  end
end
