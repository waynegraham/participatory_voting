class AddTypeAndFormatToContribution < ActiveRecord::Migration
  def change
    add_column :proposals, :contribution_type, :string
    add_column :proposals, :contribution_format, :string
  end
end
