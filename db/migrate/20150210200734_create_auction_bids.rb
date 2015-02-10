class CreateAuctionBids < ActiveRecord::Migration
  def change
    create_table :auction_bids do |t|
      t.references :auction, index: true
      t.references :user, index: true
      t.float :bid

      t.timestamps null: false
    end
    add_foreign_key :auction_bids, :auctions
    add_foreign_key :auction_bids, :users
  end
end
