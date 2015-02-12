class Auction < ActiveRecord::Base
  belongs_to :user
  has_many :bids
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
  end

  def amount
  end

  def minimum_bid
  end

  def highest_bid
  end

  def highest_bid_object
   self.highest_bid_object.bidder if highest_bid_object
  end

  def highest_bidder
    self.highest_bid_object.bidder if highest_bid_object
  end
end

