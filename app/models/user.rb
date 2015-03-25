class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # Setup accessible (or protected) attributes for your model
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :auctions
  has_many :bids
  has_one :profile
  validates_uniqueness_of :email, :message => "There is already a user with that email."
  validates_length_of :password, :minimum => 4, :allow_blank => true
  validates_confirmation_of :password
  def to_s
  	email
  end

end
