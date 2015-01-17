class ListingsController < ApplicationController
  def index
    if params[:search]
      @listings = Listing.search(params[:search]).order("created_at DESC")
    else
      @listings = Listing.all
    end
  end

  def show
    @listing = Listing.find(params[:id])
    @reservation = Reservation.new
    @reviews = Review.where(listing_id: @listing.id)
  end

  def new
    @listing = Listing.new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new
    @listing = Listing.new(listing_params)
    @listing.user_id = current_user.id

    if @listing.save
      flash[:notice] = "Listing successfully created."
      redirect_to listing_path(@listing)
    else

      render :new
    end
  end

  def edit
    @listing = current_user.listings.find(params[:id])
  end

  def update
    @listing = current_user.listings.find(params[:id])
    if @listing.update(listing_params)
      flash[:notice] = "Listing has been successfully updated."
      redirect_to listing_path(@listing)
    else
      flash[:alert] = "Please fill out the forms correctly."
      render :edit
    end
  end

  def destroy
    @listing = current_user.listings.find(params[:id])
    if @listing.destroy
      flash[:notice] = "Listing has been successfully deleted."
      redirect_to root_path
    end
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
      :user_id,
      :reservation_id,
      :place_photo,
      :review_id
    )
  end
end
