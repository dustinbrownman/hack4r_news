require 'spec_helper'

feature "Logging in" do 

  context "a user provides valid credentials" do
	  let(:user) { FactoryGirl.create(:user) }
	  before { visit new_session_path }

	  it "should have content 'Logged in!'" do 
	    fill_in 'Email', with: user.email
	    fill_in 'Password', with: user.password
	    click_button 'Log in'
	    page.should have_content 'Logged in!'
	  end
	end
end
