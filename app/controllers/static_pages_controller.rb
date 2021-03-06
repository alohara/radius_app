class StaticPagesController < ApplicationController


  def home
    @lat, @lon = cookies[:lat_lon].try(:split, "|") || "nothing set"
	if signed_in?
	  @radiuspost = current_user.radiusposts.build
	end
#    @radiusposts = Radiuspost.all
    @latitude, @longitude = cookies[:lat_lon].try(:split, "|")
 #   @radiusposts = Radiuspost.search(params[:search],@latitude,@longitude)
     @feed_items = Radiuspost.paginate(page: params[:page]).search(params[:search],@latitude,@longitude)
  end
    
  def about
  end
  
  def adminstats
    @zips = Radiuspost.unscoped.uniq.pluck(:zipcode)
#    @postcount = Radiuspost.unscoped.count(:group => "zipcode")
#	@people = Radiuspost.unscoped.count(:group => "radius_name")
	@people = User.unscoped.uniq.pluck(:radius_name)
  end

  def doThingWithGeoLocationVisitor
   @lat = params[:lat]
   @lon = params[:lon]
   
   @info= @lat+","+@lon
   
   @message= @info + "did this work?"
   
   respond_to do |format|
     format.js
   end
  end
end
