class Auction < ActiveRecord::Base
  belongs_to :user
  has_many :auction_bids
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

  def active_auctions
    where("expires_at > ?", Time.now)
  end

  def finished_auctions
    where("expires_at < ?", Time.now)
  end

  def highest_auction_bid
    self.auction_bids.maximum("bid")
  end

   def winner
      if current_user.auction_bids.closed.where(winner: true)
      else
      current_user.auction_bids.open
      end
   end
end