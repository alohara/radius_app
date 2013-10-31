class UsersController < ApplicationController
  before_filter :signed_in_user, 
                only: [:edit, :update, :show, :destroy, :index]
  before_filter :correct_user, only: [:edit, :update]
  before_filter :admin_user, only: [:destroy]

  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
	@user_profile = @user.build_user_profile
  end

  def index
#    @users = User.all
    @users = User.paginate(page: params[:page])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
	if @user.update_attributes(params[:user])
	  flash[:success] = "You've updated your profile!"
	  sign_in @user
	  redirect_to @user
	else
	  render 'edit'
	end
  end
  
  def create
    @user = User.new(params[:user])
	if @user.save
	  sign_in @user
	  redirect_to @user
	else
	  render 'new'
	end
  end

  def destroy
    User.find(params[:id]).destroy
	flash[:success] = "You don't have to go home, but you've decided to leave here!"
	redirect_to users_path
  end
  private
    
	def correct_user
	  @user = User.find(params[:id])
	  redirect_to(root_path) unless current_user?(@user)
	end

end
