require 'spec_helper'


describe "comments_controller" do 

  subject { page }

  # before js: true do
  #   @user = FactoryGirl.create(:user)
  #   log_in(@user)
  #   @post = FactoryGirl.create(:post)
  #   @user.posts << @post
  #   visit post_path(@post)
  #   click_on "New Comment"
  #   fill_in "comment_content", with: 'example comment'
  #   click_button "Create Comment"
  # end

  context "when a user posts a comment" do

    it "should have 'example comment' as content", js: true do 
      @user = FactoryGirl.create(:user)
      log_in(@user)
      @post = FactoryGirl.create(:post)
      @user.posts << @post
      visit post_path(@post)
      click_link('new_comment_link')
      fill_in "comment_content", with: 'example comment' 
      click_button "Submit"
      # page.save_screenshot('tmp/screenshot.png')
      page.should have_content 'example comment'
    end
  end

  context "when a user posts a reply" do
    before do
      #click_button 'reply'
      fill_in 'reply_content', with: 'example reply'
      click_button 'Submit'
    end

    it { should have_content 'example reply' }
    it { should have_content 'example comment' }
  end

end