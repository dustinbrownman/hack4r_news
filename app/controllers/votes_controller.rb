class VotesController < ApplicationController
  def new
    @vote = Vote.new
  end

  def create
    @vote = current_user.votes.create(post_id: params[:post_id])
    redirect_to root_url
  end
end