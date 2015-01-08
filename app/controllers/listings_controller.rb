class ListingsController < ApplicationController

  def index
    @listings = Listing.all
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def new
    @listing = Listing.new
  end

  def create

    @listing = Listing.new(listing_params)

    if @listing.save
      flash[:notice] = "You have successfully created a listing."
      redirect_to listing_path(@listing)
    else
      flash[:alert] = "Something went wrong try again"
      render :new
    end
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    if @listing.update(listing_params)
      flash[:notice] = "Your listing has been successfully updated."
      redirect_to listing_path(@listing)
    else
      flash[:alert] = "Please fill out the forms correctly."
      render :edit
    end
  end

  def destroy

  end

  private

  def listing_params
    params.require(:listing).permit(
      :title,
      :description,
      :street,
      :city,
      :state,
      :zipcode,
      :country,
      :number_bedroom,
      :property_type,
      :number_accommodate,
      :user_id
    )
  end
end
