class SessionsController < ApplicationController

	# def new
	# end

	def create
		user = User.where(name: params[:login][:name]).first

		if user && user.authenticate(params[:login][:password])
			session[:user_id] = user.id
			flash[:notice] = "Signed in successfully."

			redirect_to root_url
		else
			flash[:error] = "Sorry, either the username or password was invalid."
			render :new
		end
	end
end