class AddOrderToProposals < ActiveRecord::Migration[5.2]
  def change
    add_column :proposals, :order, :integer, default: 0
    add_index :proposals, :order
  end
end
