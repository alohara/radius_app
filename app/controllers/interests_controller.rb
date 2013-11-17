class InterestsController < ApplicationController
before_filter :signed_in_user
#before_filter :admin_user, only: [:create, :destroy, :filter]

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
