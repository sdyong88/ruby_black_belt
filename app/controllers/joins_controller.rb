class JoinsController < ApplicationController
	def create
		Join.create(user_id:session[:user_id],group_id: params[:group_id])
		redirect_to :back
	end

	def destroy
		Join.find_by(user_id:session[:user_id], group_id: params[:group_id]).destroy
		redirect_to :back
	end
end
