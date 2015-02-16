class AuctionBid < ActiveRecord::Base
  belongs_to :auction
  belongs_to :user

  before_save :convert_bid_to_cents

  validate :higher_than_current?
  validates :bid, :numericality => true

  def convert_bid_to_cents
    self.bid = (self.bid*100).to_i
  end

  def bid_in_dollars
    bid ? bid/100.0 : 0.0
  end 

  def bid_in_cents
    bid ? bid*100 : 0.0
  end

  def higher_than_current?
    if !AuctionBid.where("bid > ? AND auction_id = ?", bid_in_cents, self.auction.id).empty?
      errors.add(:bid, "is too low! It can't be lower than the current bid, sorry.")
    end  
  end
end
  
