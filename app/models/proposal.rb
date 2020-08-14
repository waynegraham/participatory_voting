# frozen_string_literal: true

##
# Proposal object
class Proposal < ApplicationRecord
  validates :title, :author, :abstract, presence: true

  acts_as_votable
end
