class ReviewsController < ApplicationController
  def create
    @reservation = Reservation.find_by(listing_id: params[:listing_id])
    @listing = Listing.find(params[:listing_id])
    @review = Review.new(review_params)
    @review.listing_id = @listing.id
    @review.user = current_user

    if @review.save
      flash[:notice] = "Review successfully created"
      redirect_to listing_path(@listing)
    else
      flash[:alert] = "Review wasn't created, try again!"
      redirect_to listing_reservation_path(@listing, @reservation)
    end
  end

  def edit
    @listing = Listing.find(params[:listing_id])
    @review = @listing.reviews.find(params[:id])
  end

  def update
    @review = current_user.reviews.find(params[:id])

    if @review.update_attributes(review_params)
      flash[:notice] = "Review successfully updated"
      redirect_to listing_path(params[:listing_id])
    else
      flash[:notice] = "Review wasn't updated, try again!"
      render :edit
    end
  end

  def destroy
    @listing = Listing.find(params[:listing_id])
    @review = Review.find(params[:id])
    @review.destroy
    flash[:notice] = "Review successfully deleted"
    redirect_to listing_path(@listing)
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :listing_id, :title, :description)
  end
end
