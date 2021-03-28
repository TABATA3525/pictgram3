class User < ApplicationRecord
  validates :name, 
    presence: true,
    length: { in: 1..15 }
    
  validates :email, 
    presence: true,
    format: { with: /\A[a-zA-z0-9.!#$\%\&\'\*\+\/\=\?\^\_\`\{\|\}\~\-']+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)+\z/ }
  
  validates :password, 
    presence: true,
    length: { in: 8..32 },
    format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)\w+\z/ }
  
  has_secure_password
end
