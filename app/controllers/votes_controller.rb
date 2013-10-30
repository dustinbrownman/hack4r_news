class VotesController < ApplicationController
  def create
    @vote = current_user.votes.create(vote_params)
    redirect_to root_path
  end

private

	def vote_params
		params.require(:vote).permit(:post_id)
	end
end
