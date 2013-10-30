require 'spec_helper'


describe "comments" do 

  context "when a user posts a comment" do
    it "should have 'example comment' as content", js: true do 
      @user = FactoryGirl.create(:user)
      log_in(@user)
      @post = FactoryGirl.create(:post)
      @user.posts << @post
      visit post_path(@post)
      click_link('new_comment_link')
      fill_in "comment_content", with: 'example comment' 
      click_on "Submit"
      page.should have_content 'example comment'
    end
  end

  context "when a user posts a reply" do
    
    it "should have 'example reply' as content", js: true do 
      @user = FactoryGirl.create(:user)
      @post = FactoryGirl.create(:post)
      @comment = FactoryGirl.create(:comment)
      @user.posts << @post
      @user.comments << @comment
      @post.comments << @comment
      log_in(@user)
      visit post_path(@post)
      click_on "Reply"
      fill_in "comment_content", with: 'example reply'
      click_on "Submit"
      page.should have_content 'example reply'
    end
  end

end