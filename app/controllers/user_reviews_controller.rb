class UserReviewsController < ApplicationController

  def index
    @user_reviews = UserReview.all
  end

  def new
    @user_review = UserReview.new
    @booking = Booking.find(params[:booking_id])
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @user_review = UserReview.new(user_review_params)
    @user_review.booking = @booking
    @user_review.save
    redirect_to user_path(@booking.user)
    # else

    # end
  end

  private

  def user_review_params
    params.require(:user_review).permit(:title, :content, :rating)
  end

end
