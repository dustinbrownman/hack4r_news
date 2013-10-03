require 'spec_helper'


describe "comments_controller" do 

  subject { page }

  before do
    @user = FactoryGirl.create(:user)
    log_in(@user)
    @post = FactoryGirl.create(:post)
    @user.posts << @post
    visit post_path(@post)
    fill_in "comment_content", with: 'example comment'
    click_button "Create Comment"
  end

  context "when a user posts a comment" do

    it { should have_content 'example comment' }
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