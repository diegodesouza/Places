class ReservationsController < ApplicationController
  def show
    @listing = Listing.find(params[:listing_id])
    @reservation = Reservation.find(params[:id])
    @reservation.listing_id = @listing.id
    @review = Review.new
  end

  def new
    @listing = Listing.find(params[:id])
    @reservation = Reservation.find_by(listing_id: @listing.id)
    @reservation.listing_id = @listing
    @review = Review.new
    @review.listing = @listing
  end

  def create
    @listing = Listing.find(params[:listing_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    @reservation.listing_id = @listing.id

    if @reservation.save
      flash[:notice] = "You have successfully booked this place"
      redirect_to listing_reservation_path(@listing, @reservation)
    else
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
