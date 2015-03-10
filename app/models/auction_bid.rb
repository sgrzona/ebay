class AuctionBid < ActiveRecord::Base
  require "date"
  belongs_to :auction
  belongs_to :user


  validate :higher_than_current?
  validates :bid, :numericality => true



  def higher_than_current?
    if !AuctionBid.where("bid > ? AND auction_id = ?", bid, self.auction.id).empty?
      errors.add(:bid, "is too low! It can't be lower than the current bid, sorry.")
    end  
  end
end
  
