class AuctionBid < ActiveRecord::Base
  belongs_to :auction
  belongs_to :bidder, :class_name => 'User'

  scope :open,  -> {joins(:auction).where("auction.expires_at > ?", Time.new)}
  scope :closed, -> {joins(:auction).where("auction.expires_at < ?", Time.new)}

  validate :higher_than_current?
  validates :bid, :numericality => true


  def higher_than_current?
    if !AuctionBid.where("bid > ? AND auction_id = ?", bid, self.auction.id).empty?
      errors.add(:bid, "is too low! It can't be lower than the current bid, sorry.")
    end  
  end
end
  
