class ProposalsController < ApplicationController

  before_action :authenticate_user!, only: [:upvote]

  def index
    @proposals = Proposal.all.order(:cached_weighted_average => :desc)
  end

  def upvote
    @proposal = Proposal.find(params[:id])
    @proposal.upvote_by current_user
    #TODO: ajax?
    redirect_to :back
  end
end
