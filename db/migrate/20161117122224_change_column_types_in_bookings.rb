class ChangeColumnTypesInBookings < ActiveRecord::Migration[5.0]
  def change
    remove_column :bookings, :start_time
    remove_column :bookings, :end_time

    add_column :bookings, :starts_at, :datetime
    add_column :bookings, :ends_at, :datetime
  end
end
