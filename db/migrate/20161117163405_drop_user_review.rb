class DropUserReview < ActiveRecord::Migration[5.0]
  def change
    drop_table :user_reviews
  end
end
