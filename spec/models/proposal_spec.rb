# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Proposal, type: :model do
  it 'is valid with valid attributes' do
    proposal = create(:proposal)
    expect(proposal).to be_valid
  end

  it 'is not valid without a title' do
    proposal = build(:proposal, title: nil)
    expect(proposal).not_to be_valid
  end

  it 'is not valid without an abstract' do
    proposal = build(:proposal, abstract: nil)
    expect(proposal).not_to be_valid
  end

  it 'is not valid without an author' do
    proposal = build(:proposal, author: nil)
    expect(proposal).not_to be_valid
  end
end
