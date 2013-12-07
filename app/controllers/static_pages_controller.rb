class StaticPagesController < ApplicationController


  def home
    @lat, @lon = cookies[:lat_lon].try(:split, "|") || "nothing set"
	if signed_in?
	  @radiuspost = current_user.radiusposts.build
	end
#    @radiusposts = Radiuspost.all
    @latitude, @longitude = cookies[:lat_lon].try(:split, "|")
 #   @radiusposts = Radiuspost.search(params[:search],@latitude,@longitude)
     @feed_items = Radiuspost.search(params[:search],@latitude,@longitude)
  end
    
  def about
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
