class BookingsController < ApplicationController
  before_action :find_space, only: [ :new, :create, :destroy ]

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = @space.bookings.build(booking_params)
    @booking.save
  end

  def destroy
    @booking.destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :start_time, :end_time)
  end

  def find_space
    @space = Space.find(params[:space_id])
  end
end
