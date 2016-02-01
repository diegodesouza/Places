class ReservationsController < ApplicationController
  before_action :find_reservation, only: [:show, :destroy]
  before_action :find_current_user_reservation, only: [:edit, :update, :destroy]
  before_action :find_listing_id, only: [:show, :new, :create, :edit, :destroy]

  def show
    if current_user != @reservation.user
      flash[:alert] = "Access Denied"
      redirect_to root_path
    else
      @reservation.listing_id = @listing.id
      @reservation.user = current_user
      @review = Review.new
    end
  end

  def new
    @review = Review.new
    @review.listing = @listing
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.listing_id = @listing.id
    @reservation.user = current_user

    if @reservation.save
      flash[:notice] = "You have successfully booked this place"
      redirect_to listing_reservation_path(@listing, @reservation)
    else
      redirect_to listing_path(@listing)
    end
  end

  def edit
  end

  def update
    if user_signed_in?
      if @reservation.update_attributes(reservation_params)
        flash[:notice] = "You have successfully updated your reservation"
        redirect_to listing_path(params[:listing_id])
      else
        render :edit
      end
    else
      flash[:alert] = "You must be signed in to update a reservation."
      redirect_to users_url
    end
  end

  def destroy
    @reservation.destroy
    redirect_to listing_path(@listing)
  end

  private

  def reservation_params
    params.require(:reservation).permit(:user_id, :listing_id, :check_in, :check_out)
  end

  def find_reservation
    @reservation = Reservation.find(params[:id])
  end

  def find_current_user_reservation
    @reservation = current_user.reservation.find(params[:id])
  end

  def find_listing_id
    @listing = Listing.find(params[:listing_id])
  end
end
