class Profile < ActiveRecord::Base
  
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :blurb, presence: true
  belongs_to :user

  # Paperclip
  has_attached_file :photo, :styles => { :medium => "400x400>", :thumb => "50x50>", :regular => "200x200>" }
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end
