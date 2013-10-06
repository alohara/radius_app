class StaticPagesController < ApplicationController
  def home
  end

  def about
  end

  def doThingWithGeoLocationVisitor
   @lon = params[:lon]
   @lat = params[:lat]
   
   @info= @lat+','+@lon
   
   @message= @info + "did this work?"
   
   respond_to do |format|
     format.js
   end
  end
end
