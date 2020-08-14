# frozen_string_literal: true

class AddOrderToProposals < ActiveRecord::Migration[6.0]
  def change
    change_table :proposals, bulk: true do |t|
      t.integer :order, default: 0
    end
    add_index :proposals, :order
  end
end
