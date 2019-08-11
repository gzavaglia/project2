class User < ActiveRecord::Base
  has_secure_password
  
  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  
  
  has_many :shows 
end