class ReservationsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

  def show
    @listing = Listing.find(params[:listing_id])
    @reservation = @listing.reservations.find(params[:id])
  end

  def new
    @listing = Listing.new
    @reservation = Reservation.new
  end

  def create
    @listing = Listing.find(params[:listing_id])
    @reservation = @listing.reservations.new(reservation_params)
    @reservation.user_id = current_user.id

    if @reservation.save
      flash[:notice] = "You have successfully booked this place"
      redirect_to listing_reservation_path(@listing, @reservation)
    else
      flash[:notice] = "Sorry, that didn't work!"
      redirect_to listing_path(@listing)
    end
  end

  def edit
    @listing = Listing.find(params[:listing_id])
    @reservation = current_user.reservations.find(params[:id])
  end

  def update
    @reservation = current_user.reservation.find(params[:id])
    if user_signed_in?
      if @reservation.update_attributes(reservation_params)
        flash[:notice] = "You have successfully updated your reservation"
        redirect_to listing_path(params[:listing_id])
      else
        render :edit
      end
    else
      flash[:alert] = "You must be signed in to update a reservation."
      render :edit
    end
  end

  def destroy
    @reservation = current_user.reservation.find(params[:id])
    @listing = Listing.find(params[:listing_id])
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to listing_path(@listing)
  end

  private

  def reservation_params
    params.require(:reservation).permit(:user_id, :listing_id, :check_in, :check_out)
  end
end
