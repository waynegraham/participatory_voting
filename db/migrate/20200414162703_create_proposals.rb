# frozen_string_literal: true

class CreateProposals < ActiveRecord::Migration[6.0]
  def change
    create_table :proposals do |t|
      t.string :author
      t.string :title
      t.text :abstract

      t.timestamps
    end
  end
end
