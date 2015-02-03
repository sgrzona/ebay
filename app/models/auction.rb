class Auction < ActiveRecord::Base
  belongs_to :user

  before_save :set_expiration

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def set_expiration
    unless expires_at.present?
      self.expires_at = 1.week.from.now
    end

    true
  end

end
