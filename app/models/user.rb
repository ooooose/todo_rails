class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 } ,uniqueness: true
  validates :password_digest, presence: true, length: { minimum: 6 } 
  has_secure_password
end
