class User < ActiveRecord::Base

  has_many :notes
  has_many :groups
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,  
         :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation
  # attr_accessible :title, :body
  
  before_save :ensure_authentication_token
  def skip_confirmation!
  	self.confirmed_at = Time.now
  end
end
