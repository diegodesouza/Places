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

  private

  def listing_params
    params.require(:listing).permit(:title, :description, :street, :city, :state, :country, :number_bedroom, :property_type, :number_accommodate)
  end
end
