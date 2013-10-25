class StaticPagesController < ApplicationController

  def home
    @lat, @lon = cookies[:lat_lon].try(:split, "|") || "nothing set"
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
