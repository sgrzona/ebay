class AddExpirationToAuctions < ActiveRecord::Migration
  def change
    add_column :auctions, :expires_at, :datetime
  end
end
