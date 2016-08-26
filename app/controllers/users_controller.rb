class UsersController < ApplicationController
  def index
  end

  def create
  	@user = User.create(user_params)
  	if @user.valid?
  		flash[:success] = "Success!"
  		redirect_to "/"
  	else
  		flash[:errors] = @user.errors.full_messages
  		redirect_to "/"
  	end
  end 


  private
  def user_params
  	params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end
