class SessionsController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
		puts "params: "
		p params["user"]["email"]
    user_params = params.require(:user).permit(:email, :password)
		User.create(user_params)
    @user = User.find_by(email: params["user"][:email])
		puts "created a user?"
		p @user
    if @user
      login(@user)
      redirect_to @user
    else
      flash[:error] = 'Invalid email/password combination'
      redirect_to sign_in_path
    end
  end

  def destroy
    logout
    redirect_to root_path
  end

end
