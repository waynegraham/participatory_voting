class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.string :author
      t.text :abstract

      t.timestamps null: false
    end
  end
end
