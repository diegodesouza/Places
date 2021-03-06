class ListingsController < ApplicationController
  before_action :find_current_user_listing, only: [:edit, :update, :destroy]

  def index
    if params[:search].present?
      @listings = Listing.search(params[:search])
    else
      @listings = Listing.all
    end
    @listings = @listings.order('created_at DESC').page params[:page]
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
    @listing.user = current_user

    if @listing.save
      flash[:notice] = "Listing successfully created."
      redirect_to listing_path(@listing)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @listing.update(listing_params)
      flash[:notice] = "Listing has been successfully updated."
      redirect_to listing_path(@listing)
    else
      flash[:alert] = "#{@listings.errors.full_messages}"
      render :edit
    end
  end

  def destroy
    if @listing.destroy
      flash[:notice] = "Listing has been successfully deleted."
      redirect_to root_path
    else
      redirect_to :back
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
      :review_id,
      {photos: []}
    )
  end

  def find_current_user_listing
    @listing = current_user.listings.find(params[:id])
  end
end
