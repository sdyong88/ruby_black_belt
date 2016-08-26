class GroupsController < ApplicationController
  def index
  	@user = User.find(session[:user_id])
  	@groups = Group.all

  end

  def create

  	@user = User.find(session[:user_id])
  	@group = Group.create(name: params[:name], description: params[:description],user_id: params[:user_id])
  		if @group.valid?
  			redirect_to :back
  		else
  			flash[:errors] = @group.errors.full_messages
  			redirect_to :back
  		end
  end

  def show
  	@user = User.find(session[:user_id])
  	@group = Group.find(params[:id])
  	@members = @group.joins.joins(:user).select(:first_name)
    @owner = @group.user
  end
  def destroy
  	group = Group.find_by(id: params[:group_id])
  	if group.valid?
  		group.delete
  	end
  	redirect_to :back
  end
end
