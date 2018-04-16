# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProposalsController, type: :controller do
  describe 'GET index' do
    it 'has a 200 status code' do
      get :index
      expect(response.status).to eq(200)
    end

    it 'assigned @proposals' do
      proposal = create :proposal
      get :index
      expect(assigns(:proposals)).to eq([proposal])
    end
  end

  describe 'POST #upvote' do
    let(:proposal) { create :proposal }

    # it 'requires login' do
    #   put :upvote, params: { id: proposal.id }
    #   expect(reponse).to redirect_to(proposal)
    # end
  end
end
