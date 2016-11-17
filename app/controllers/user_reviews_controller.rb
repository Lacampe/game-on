class UserReviewsController < ApplicationController
  before_action :find_user, only: [ :new, :create ]

  def index
    @user_reviews = UserReview.all
  end

  def new
    @user_review = UserReview.new
  end

  def create
    @user_review = @user.user_reviews.build(user_review_params)
    @user_review.save
  end

  private

  def user_review_params
    params.require(:user_review).permit(:title, :content, :rating)
  end

  def find_user
    @user = User.find(params[user_id])
  end
end
