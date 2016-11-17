class BookingsController < ApplicationController
  before_action :find_space, only: [ :new, :create, :destroy ]
  before_action :find_booking, only: [ :show, :destroy, :confirm]

  def show
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
    UserNotifier.send_user_booking_confirmation_email(@booking).deliver
    UserNotifier.send_owner_booking_confirmation_email(@booking).deliver
    redirect_to space_booking_path(@space, @booking)
  end

  def destroy
    @booking.destroy
    flash[:notice] = "Booking has been rejected"
    redirect_to root
  end

  def confirm
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

  def find_booking
    @booking = Booking.find(params[:id])
  end
end
