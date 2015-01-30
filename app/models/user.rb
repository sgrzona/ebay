class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
<<<<<<< HEAD
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :pins
  

  def to_s
  	email
  end

=======
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
>>>>>>> 6c91d9a19701d9a2721e049d0a3709a96c84ca6f
end
