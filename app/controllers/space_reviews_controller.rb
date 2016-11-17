class SpaceReviewsController < ApplicationController
  before_action :find_space, only [ :new, :create ]

  def index
    @space_reviews = SpaceReview.all
  end

  def new
    @space_review = SpaceReview.new
  end

  def create
    @space_review = @space.space_reviews.build(space_review_params)
    @space_review.save
  end

  private

  def space_review_params
    params.require(:space_reviews).permit(:title, :content, :rating)
  end

  def find_space
    @space = Space.find(params[space_id])
  end
end
