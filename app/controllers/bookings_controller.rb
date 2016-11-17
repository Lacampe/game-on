class BookingsController < ApplicationController
  before_action :find_space, only: [ :new, :create, :destroy ]

  def show
    @booking = Booking.find(params[:id])
    @space = Space.find(@booking.space_id)
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = @space.bookings.build(booking_params)
    @booking.user = current_user
    @booking.save
    redirect_to space_booking_path(@space, @booking)
  end

  def destroy
    @booking.destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:starts_at, :duration)
  end

  def find_space
    @space = Space.find(params[:space_id])
  end
end
