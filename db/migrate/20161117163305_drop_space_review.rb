class DropSpaceReview < ActiveRecord::Migration[5.0]
  def change
    drop_table :space_reviews
  end
end
