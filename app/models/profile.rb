class Profile < ActiveRecord::Base

  attr_accessor :image_file_name
  attr_accessor :image_content_type
  attr_accessor :image_file_size
  attr_accessor :image_updated_at

  belongs_to :user
  has_one :profile

 has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
 validates_attachment :image, content_type: { content_type: /\Aimage\/.*\Z/ }

   validates :image, presence: true
   validates :username, presence: true
   validates :first_name, presence: true
   validates :last_name, presence: true
   validates :blurb, presence: true
   validates_length_of :username, :minimum => 4


     def to_s
      "#{first_name} #{last_name}"
     end
end


