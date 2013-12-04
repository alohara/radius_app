class SessionsController < ApplicationController

def new
end

def create
  user = User.find_by_radius_name(params[:session][:radius_name].downcase)
  if user && user.authenticate(params[:session][:password])
    sign_in user
    redirect_to user
  else
    flash.now[:error] = 'We Could Not Find The Radius Name/Password Combination Entered'
    render 'new'
  end
end

def destroy
 sign_out
 redirect_to root_path
end

end
