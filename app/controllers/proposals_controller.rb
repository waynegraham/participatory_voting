class ProposalsController < ApplicationController

  before_action :authenticate_user!, only: [:upvote]

  def index
    seed_val = Proposal.connection.quote(cookies[:rand_seed])
    Proposal.connection.execute("SELECT SETSEED(#{seed_val})")
    # @proposals = Proposal.all.order(:title)
    @proposals = Proposal.order('random()')
  end

  def upvote
    @proposal = Proposal.find(params[:id])
    if(current_user.voted_for? @proposal)
      @proposal.unvote_by current_user
    else
      @proposal.upvote_by current_user
    end
    # expire_fragment(@proposal)
    # redirect_to :back
    div = "#proposal-#{@proposal.id}"
    redirect_to(request.env["HTTP_REFERER"] + "#{div}")
  end
end
