# frozen_string_literal: true

##
# Proposal
class Proposal < ApplicationRecord
  # belongs_to :user
  acts_as_votable
end
