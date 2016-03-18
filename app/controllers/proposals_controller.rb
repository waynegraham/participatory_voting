class ProposalsController < ApplicationController

  before_action :authenticate_user!, only: [:upvote]

  def index
    @proposals = Proposal.all.order(:cached_weighted_average => :desc)
  end

  def upvote
    @proposal = Proposal.find(params[:id])
    if(current_user.voted_for? @proposal)
      @proposal.unvote_by current_user
    else
      @proposal.upvote_by current_user
    end
    #TODO: ajax?
    redirect_to :back
  end
end
