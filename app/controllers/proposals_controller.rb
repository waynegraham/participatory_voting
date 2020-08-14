# frozen_string_literal: true

##
# Main controller for a Proposal
class ProposalsController < ApplicationController
  # before_action :set_proposal, only: %i[show edit update destroy like unlike]
  before_action :set_proposal, only: %i[like unlike]
  before_action :set_proposals, only: %i[index stats]
  before_action :authenticate_user!, only: %i[like unlike]

  # GET /proposals
  # GET /proposals.json
  def index; end

  def stats; end

  def like
    @proposal.liked_by current_user
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end

  def unlike
    @proposal.unliked_by current_user
    # render layout: false
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end

  # # GET /proposals/1
  # # GET /proposals/1.json
  # def show; end
  #
  # # GET /proposals/new
  # def new
  #   @proposal = Proposal.new
  # end
  #
  # # GET /proposals/1/edit
  # def edit; end
  #
  # # POST /proposals
  # # POST /proposals.json
  # def create
  #   @proposal = Proposal.new(proposal_params)
  #
  #   respond_to do |format|
  #     if @proposal.save
  #       format.html { redirect_to @proposal, notice: 'Proposal was successfully created.' }
  #       format.json { render :show, status: :created, location: @proposal }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @proposal.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  #
  # # PATCH/PUT /proposals/1
  # # PATCH/PUT /proposals/1.json
  # def update
  #   respond_to do |format|
  #     if @proposal.update(proposal_params)
  #       format.html { redirect_to @proposal, notice: 'Proposal was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @proposal }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @proposal.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  #
  # # DELETE /proposals/1
  # # DELETE /proposals/1.json
  # def destroy
  #   @proposal.destroy
  #   respond_to do |format|
  #     format.html { redirect_to proposals_url, notice: 'Proposal was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_proposal
    @proposal = Proposal.find(params[:id])
  end

  def set_proposals
    @proposals = Proposal.all
  end

  # Only allow a list of trusted parameters through.
  def proposal_params
    params.require(:proposal).permit(:author, :title, :abstract)
  end
end
