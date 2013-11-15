class RadiuspostsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user, only: :destroy
  

  def create
    @radiuspost = current_user.radiusposts.build(params[:radiuspost])
    @radiuspost.interest = Interest.find_by_id(@radiuspost.interest_id).category
#	@radiuspost.content_ip = request.remote_ip
	if @radiuspost.save
	  flash[:success] = "Radiuspost created, yo!"
	  redirect_to root_path
	else
	  @feed_items = []
	  render 'static_pages/home'
	end
  end

  def destroy
    @radiuspost.destroy
	redirect_back_or root_path
  end
 
  private
  
    def correct_user
	  @radiuspost = current_user.radiusposts.find_by_id(params[:id])
	  redirect_to root_path if @radiuspost.nil?
	end
end
