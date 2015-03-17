class AddProcessedToAuctions < ActiveRecord::Migration
  def change
    add_column :auctions, :processed, :boolean
  end
end
