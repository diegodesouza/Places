class ReviewsController < ApplicationController
  def index
    @reviews = Review.All
  end

  def new
    @reviews = Review.new
  end

  def create
    @listing = Listing.find(params[:listing_id])
    @reservation = Reservation.find(params[:reservation_id])
    @listing.user = current_user
    @review = Review.new(review_params)

    if @review.save
      flash[:notice] = "You have successfully created a review"
      redirect_to listing_path(@listing)
    else
      flash[:alert] = "Something went wrong"
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
      flash[:notice] = "Something went wrong"
      render :edit
    end
  end

  def destroy
    @listing = current_user.listings.find(params[:listing_id])
    @review = Review.find(parmas[:id])
    @review.destroy
    redirect_to listing_path(@lisitng)
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :listing_id, :title, :description)
  end
end
