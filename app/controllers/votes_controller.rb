class VotesController < ApplicationController

  def create
    @vote = current_user.votes.create(post_id: params[:post_id])
    redirect_to root_url
  end
end