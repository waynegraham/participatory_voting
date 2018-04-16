class AddTitleToAbstract < ActiveRecord::Migration[4.2]
  def change
    add_column :proposals, :title, :string

    add_index :proposals, :title
  end
end
