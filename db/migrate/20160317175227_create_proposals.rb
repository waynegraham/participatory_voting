# frozen_string_literal: true

class CreateProposals < ActiveRecord::Migration[4.2]
  def change
    create_table :proposals do |t|
      t.string :author
      t.text :abstract

      t.timestamps null: false
    end
  end
end
