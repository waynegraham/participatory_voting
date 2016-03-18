class ProposalsController < ApplicationController

  before_action :authenticate_user!, only: [:upvote]

  def index
    @proposals = Proposal.all.order(:title)
  end

  def upvote
    @proposal = Proposal.find(params[:id])
    if(current_user.voted_for? @proposal)
      @proposal.unvote_by current_user
    else
      @proposal.upvote_by current_user
    end
    # redirect_to :back
    div = "#proposal-#{@proposal.id}"
    redirect_to(request.env["HTTP_REFERER"] + "#{div}")
  end
end
