# frozen_string_literal: true

##
# Proposal object
class Proposal < ApplicationRecord
  validates :title, :abstract, :contribution_type, :contribution_format, presence: true

  acts_as_votable
end
