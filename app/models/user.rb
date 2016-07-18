class User < ActiveRecord::Base
	has_many :songs

	validates :user_name, presence: true
  	validates :email, presence: true, uniqueness: true
  	validates :password, presence: true
  	

  	has_secure_password
  	def self.confirm(params)
    	@user = User.find_by({email: params[:email]})
    	@user.try(:authenticate, params[:password])
  	end


  	
end

