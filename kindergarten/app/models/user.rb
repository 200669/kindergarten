class User < ActiveRecord::Base
  #before_save { self.email = email.downcase }
  validates :login,  presence: true, length: { maximum: 50 },
                     uniqueness: true
  validates :name, presence: true, length: { maximum: 20 }
  validates :lastname, presence: true, length: { maximum: 30 }
  
  has_secure_password
  validates :password, presence: true, length: { minimum: 8 }
end
