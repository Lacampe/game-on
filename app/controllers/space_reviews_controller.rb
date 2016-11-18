class SpaceReviewsController < ApplicationController
  def show
    @space_review = SpaceReview.find(params[:booking_id])
  end

  def new
    @space_review = SpaceReview.new
    @booking = Booking.find(params[:booking_id])
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @space_review = SpaceReview.new(space_review_params)
    @space_review.booking = @booking
    @space_review.save
    redirect_to space_path(@booking.space)
    # else

    # end
  end

  private

  def space_review_params
    params.require(:space_review).permit(:title, :content, :rating)
  end
end
