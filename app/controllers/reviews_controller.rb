class ReviewsController < ApplicationController
  def index
    @reviews = Review.All
  end

  def new
    @review = Review.new
  end

  def create
    @reservation = Reservation.find_by(listing_id: params[:listing_id])
    @listing = Listing.find(params[:listing_id])
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.listing_id = @listing.id

    if @review.save
      flash[:notice] = "You have successfully created a review"
      redirect_to listing_path(@listing)
    else
      flash[:alert] = "Review wasn't created, try again!"
      render 'listings/show'
    end
  end

  def edit
    @listing = current_user.listings.find(params[:listing_id])
    @review = current_user.reviews.find(params[:id])
  end

  def update
    @review = current_user.reviews.find(params[:id])

    if @review.update_attributes(review_params)
      flash[:notice] = "You have successfully updated your review"
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
    redirect_to listing_path(@listing)
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :listing_id, :title, :description)
  end
end
