
class Auction < ActiveRecord::Base
  belongs_to  :seller, :class_name => 'User'
  has_many :bids, :through => :bidder
  before_create :set_expiration 
  before_save :set_expiration
  validates :title, :presence => true
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]



  def set_expiration
    unless expires_at.present?
     self.expires_at = 1.week.from_now
  end

    true
  end

  def open_auctions
    where("expires_at > ?", Time.now)
  end

  def closed_auctions
    where("expires_at < ?", Time.now)
  end

  def highest_auction_bid
    self.auction_bids.maximum("bid")
  end


  def highest_auction_bidder
    auction.user == auction.highest_auction_bid
  end 
end
