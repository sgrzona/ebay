class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # Setup accessible (or protected) attributes for your model
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :auctions
  has_many :bids
  validates_uniqueness_of :name, :message => "There is already a user with that name."

  def to_s
  	email
  end

end
