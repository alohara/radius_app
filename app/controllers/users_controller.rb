class UsersController < ApplicationController
  before_filter :signed_in_user, 
                only: [:edit, :update, :show, :destroy, :index]
  before_filter :correct_user, only: [:edit, :update, :show]
#  before_filter :admin_user, only: [:edit, :update, :show, :destroy, :index]
  before_filter :admin_user, only: :destroy
  require 'twitter'

  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
  
  def show
    @user = User.find(params[:id])
	@radiusposts = @user.radiusposts.paginate(page: params[:page])
  end
  
  def new
    @user = User.new
	@user_profile = @user.build_user_profile
  end
  def index
   @users = User.paginate(page: params[:page])
  end
  
  def update_tweets
#    @users = User.all
#    @users = User.paginate(page: params[:page])
	@tweeters = User.tweeters.all
	unless @tweeters.nil?
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "REMOVED"
      config.consumer_secret     = "REMOVED"
      config.access_token        = "REMOVED"
      config.access_token_secret = "REMOVED"
    end
	@tweeters.each do |element|
      @tweeter_profile = UserProfile.find_by_id(element.id)
	  @content = client.user_timeline(element.twitter_id, :since_id => element.tweet_since_id).reverse
	  unless @content.nil?
        @content.each do |post|
		  if post.id > element.tweet_since_id
            @radiustweet = Radiuspost.new
            @radiustweet.user_id = element.id
            @radiustweet.zipcode = @tweeter_profile.default_zipcode
            @radiustweet.latitude = @tweeter_profile.latitude
            @radiustweet.longitude = @tweeter_profile.longitude
            @radiustweet.radius_name = element.radius_name
            @radiustweet.visible = true
            @radiustweet.interest_id = 1
            @radiustweet.interest = "PSA"
            @radiustweet.subcity = element.first_name
		    element.tweet_since_id = post.id 
            @radiustweet.content = post.text
		    @radiustweet.save
    	    @tweet_since_id = element.tweet_since_id
		  end
	    end
	  end
	  unless @tweet_since_id.nil?
        @tweeter = User.tweeters.find_by_id(element.id)
	    @tweeter.update_attribute(:tweet_since_id, @tweet_since_id)
	  end
	end
	end
   redirect_to(root_path)
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
	  redirect_to(root_path) unless current_user?(@user) || current_user.admin?
	end
end
