class AddColumnDurationToBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :duration, :integer
  end
end
