class CreateAbstracts < ActiveRecord::Migration
  def change
    create_table :abstracts do |t|
      t.string :author
      t.text :abstract

      t.timestamps null: false
    end
  end
end
