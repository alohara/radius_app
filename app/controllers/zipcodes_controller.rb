class ZipcodesController < ApplicationController
before_filter :signed_in_user
before_filter :admin_user, only: [:create, :destroy, :filter, :edit, :update]

  def new
  end
 
  def show
    @zipcodes = Zipcode.search(params[:search])
	@zipcode = Zipcode.new
  end

  def edit
    @zipcode = Zipcode.find(params[:id])
  end

  def update
    @zipcode = Zipcode.find(params[:id])
	if @zipcode.update_attributes(params[:zipcode])
	  flash[:success] = "You've updated this zip!"
	  redirect_to @zipcode
	else
	  render 'edit'
	end
  end

  def create
    @zipcode = Zipcode.new(params[:zipcode])
	if @zipcode.save
	  flash[:success] = "You've created a new zipcode, use it carefully."
	  redirect_to @zipcode
	else
	  render 'new'
	end
  end
  
  def index
    @zipcodes = Zipcode.paginate(page: params[:page])
  end
  
  def destroy
    @zipcodes = Zipcode.find(params[:id])
    if @zipcodes.present?
      @zipcodes.destroy
    end
	redirect_to zipcodes_path
  end
end
