class AddTitleToAbstract < ActiveRecord::Migration
  def change
    add_column :proposals, :title, :string

    add_index :proposals, :title
  end
end
