class AddCachedVotesToProposals < ActiveRecord::Migration
  def change
    add_column :proposals, :cached_votes_total, :integer, :default => 0
    add_column :proposals, :cached_votes_score, :integer, :default => 0
    add_column :proposals, :cached_votes_up, :integer, :default => 0
    add_column :proposals, :cached_votes_down, :integer, :default => 0
    add_column :proposals, :cached_weighted_score, :integer, :default => 0
    add_column :proposals, :cached_weighted_total, :integer, :default => 0
    add_column :proposals, :cached_weighted_average, :float, :default => 0.0
    add_index  :proposals, :cached_votes_total
    add_index  :proposals, :cached_votes_score
    add_index  :proposals, :cached_votes_up
    add_index  :proposals, :cached_votes_down
    add_index  :proposals, :cached_weighted_score
    add_index  :proposals, :cached_weighted_total
    add_index  :proposals, :cached_weighted_average
  end
end
