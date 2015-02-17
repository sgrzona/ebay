class Auction < ActiveRecord::Base
  belongs_to :user
  has_many :auction_bids
  before_save :set_expiration

  validates :title, :uniqueness => true
  

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]


  def set_expiration
    unless expires_at.present?
      self.expires_at = 1.week
    end

    true
  end


  def starts_at_date
    DateTime.now
  end

  def starts_at_time
    DateTime.now
  end

  def expires_at_date
    DateTime.now + 7
  end

  def expires_at_time
    DateTime.now + 7
  end

  def self.get_active_auctions
    where("expires_at_date > ?", DateTime.now)
  end

  def amount
  end


  def highest_auction_bid
    self.auction_bids.maximum("bid")
  end
end

