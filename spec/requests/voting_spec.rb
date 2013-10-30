require 'spec_helper'

feature "Upvoting" do 
	context "clicking on the arrow next to a post" do 
		let(:user) { FactoryGirl.create(:user) }

		it "should add a vote to the post and redirect to main page" do
			post = FactoryGirl.create(:post, user: user)
			log_in(user)
			visit root_path
			click_on '▲'
			page.should have_content '1 vote'
		end
	end
end
