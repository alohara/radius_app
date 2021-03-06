class RadiuspostsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user, only: :destroy
  require 'open-uri'
  require 'json'
  
  def show
#    @radiusposts = Radiuspost.search(params[:search])
  end

  def create
    @radiuspost = current_user.radiusposts.build(params[:radiuspost])
    @radiuspost.interest = Interest.find_by_id(@radiuspost.interest_id).category
	@radiuspost.radius_name = current_user.radius_name
#	@radiuspost.content_ip = request.remote_ip
    @latitude, @longitude = cookies[:lat_lon].try(:split, "|")
	@radiuspost.latitude = @latitude
	@radiuspost.longitude = @longitude
	@goog_api = "http://maps.googleapis.com/maps/api/geocode/json?latlng="
    @latlon = @latitude + "," + @longitude
	@goog_sensor = "&sensor=false"
    @final_file = @goog_api + @latlon + @goog_sensor
	@result = JSON.parse(open(@final_file).read)
    @radiuspost.zipcode = "00001"
	@result["results"].each do |type|
      type["address_components"].each do |name|
	    case name["types"]
	      when [ "postal_code" ]
          @radiuspost.zipcode = name["short_name"]
		  when [ "administrative_area_level_2", "political" ]
          @radiuspost.city = name["short_name"]
		  when [ "locality", "political" ]
          @radiuspost.subcity = name["short_name"]
		end
	  end
	end

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
