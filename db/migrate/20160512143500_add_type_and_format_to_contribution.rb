# frozen_string_literal: true

class AddTypeAndFormatToContribution < ActiveRecord::Migration[4.2]
  def change
    add_column :proposals, :contribution_type, :string
    add_column :proposals, :contribution_format, :string
  end
end
