class AddAttachmentImageToAuctions < ActiveRecord::Migration
  def self.up
    change_table :auctions do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :auctions, :image
  end
end
