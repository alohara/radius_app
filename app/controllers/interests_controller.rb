class InterestsController < ApplicationController
before_filter :signed_in_user
before_filter :admin_user, only: [:create, :destroy, :filter, :edit, :update]

  def new
  end
 
  def show
    @interests = Interest.search(params[:search])
	@interest = Interest.new
  end
 
  def create
    @interest = Interest.new(params[:interest])
	if @interest.save
	  flash[:success] = "You've created a new Interest, use it carefully."
	  redirect_to @interest
	else
	  render 'new'
	end
  end

  def edit
    @interest = Interest.find(params[:id])
  end

  def update
    @interest = Interest.find(params[:id])
	if @interest.update_attributes(params[:interest])
	  flash[:success] = "You've updated this zip!"
	  redirect_to @interest
	else
	  render 'edit'
	end
  end

  def index
    @interests = Interest.paginate(page: params[:page])
  end
  
  def destroy
    @interests = Interest.find(params[:id])
    if @interests.present?
      @interests.destroy
    end
	redirect_to interests_path
  end
end
