class Profile < ActiveRecord::Base
 belongs_to :user
 has_one :profile


   validates :first_name, presence: true
   validates :last_name, presence: true
   validates :blurb, presence: true
  
  #has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  #validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def to_s
    "#{first_name} #{last_name}"
  end
end
