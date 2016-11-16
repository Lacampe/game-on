class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.date :date
      t.time :start_time
      t.time :end_time
      t.integer :price
      t.references :user, foreign_key: true
      t.references :space, foreign_key: true

      t.timestamps
    end
  end
end
