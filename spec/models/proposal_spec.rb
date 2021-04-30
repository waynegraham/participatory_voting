# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Proposal, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.build(:proposal)).to be_valid
  end

  it 'is not valid without a title' do
    proposal = FactoryBot.build(:proposal, title: nil)
    expect(proposal).not_to be_valid
  end

  it 'is not valid without an contribution_type' do
    proposal = FactoryBot.build(:proposal, contribution_type: nil)
    expect(proposal).not_to be_valid
  end

  it 'is not valid without an contribution_format' do
    proposal = FactoryBot.build(:proposal, contribution_format: nil)
    expect(proposal).not_to be_valid
  end

  # it 'is not valid without an author' do
  #   proposal = FactoryBot.build(:proposal, author: nil)
  #   expect(proposal).not_to be_valid
  # end

  it 'is not valid without an abstract' do
    proposal = FactoryBot.build(:proposal, abstract: nil)
    expect(proposal).not_to be_valid
  end
end
