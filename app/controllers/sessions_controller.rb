class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by_email(params[:Email])

		if user && user.authenticate(params[:Password])
			# Sign in user -> user show
			sign_in user
			redirect_to user
		else
			# Create error msg -> signin
			flash.now[:error] = 'Invalid email/password combination'
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_path
	end
end
