class AddWinnerToAuctionBids < ActiveRecord::Migration
  def change
    add_column :auction_bids, :winner, :boolean
  end
end
