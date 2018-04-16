# frozen_string_literal: true

##
# Proposal
class Proposal < ApplicationRecord
  validates :title, :author, :abstract, presence: true
  # belongs_to :user
  acts_as_votable
end
