class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "Sign up successfully!"
			redirect_to root_url
		else
			render 'new'
		end
	end

	def show

	end

	private
		def user_params
			params.require(:user).permit(:name, :email, :address, :password, :password_confirmation)
		end
end
