# frozen_string_literal: true

class AddContributionTypeToProposal < ActiveRecord::Migration[6.0]
  def change
    change_table :proposals, bulk: true do |t|
      t.string :contribution_type
      t.string :contribution_format
    end

    add_index :proposals, :contribution_type
  end
end
