class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
	@user.build_user_profile
  end

  def index
    @users = User.all
  end
  
  def create
    @user = User.new(params[:user])
	if @user.save
	  redirect_to @user
	else
	  render 'new'
	end
  end
  
end
