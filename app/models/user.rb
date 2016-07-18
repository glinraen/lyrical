class User < ActiveRecord::Base


	validates :user_name, presence: true
  	validates :email, presence: true, uniqueness: true
  	validates :password, presence: true
  	

  	has_secure_password

  	
end

