class User < ActiveRecord::Base


	validates :user_name, presence: true
  	validates :email, presence: true, confirmation: true, uniqueness: true
  	validates :password, presence: true, confirmation: true, on: :create
  	validates :password, length: {minimum: 5, maximum: 120}, on: :update, allow_blank: true

  	has_secure_password

  	def self.confirm(params)
    	@user = User.find_by({email: params[:email]})
    	@user.try(:authenticate, params[:password])
  	end
end

