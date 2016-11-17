class BookingsController < ApplicationController
  before_action :find_space, only: [ :new, :create, :destroy ]

  def show
    @booking = Booking.find(params[:id])
    @space = Space.find(@booking.space_id)
    @user = User.find(@booking.user_id)
    @owner = User.find(@space.user_id)
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = @space.bookings.build(booking_params)
    @booking.user = current_user
    @booking.price = (@space.price_per_hour.to_i * @booking.duration.to_i)
    @booking.save
    redirect_to space_booking_path(@space, @booking)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    flash[:notice] = "Booking has been rejected"
    redirect_to root
  end

  def confirm
    @booking = Booking.find(params[:id])
    @booking.confirmed = true
    @booking.save
    flash[:notice] = "Booking has been confirmed"
    redirect_to booking_path(@booking)
  end

  private

  def booking_params
    params.require(:booking).permit(:starts_at, :duration)
  end

  def find_space
    @space = Space.find(params[:space_id])
  end
end
