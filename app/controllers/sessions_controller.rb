class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by_email(params[:email])
  	if user
  		session[:user_id] = user.id
  		redirect_to "/groups"
  	else
  		flash[:errors] = ["Invalid combo"]
  		redirect_to '/'
  	end
	end
	def destroy
		session[:user_id] = nil
		redirect_to "/"
	end
end
