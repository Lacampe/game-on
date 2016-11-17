class DeleteColsInBookings < ActiveRecord::Migration[5.0]
  def change
    remove_column :bookings, :duration
    remove_column :bookings, :date
  end
end
