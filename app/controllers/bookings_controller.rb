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
    @booking.valid?
    @booking.price = @booking.duration * @space.price_per_hour
    @booking.save
    @user = User.find(@booking.user_id)
    @owner = User.find(@space.user_id)
    # UserMailer.send_user_booking_confirmation_email(@booking, @owner, @user).deliver
    # UserMailer.send_owner_booking_confirmation_email(@booking, @owner, @user).deliver
    UserNotifierMailer.send_user_booking_confirmation_email(@booking, @owner, @user).deliver
    UserNotifierMailer.send_owner_booking_confirmation_email(@booking, @owner, @user).deliver

    redirect_to booking_path(@booking)
  end

  def destroy
    @user = User.find(@booking.user_id)
    # UserMailer.send_user_bookingrejected_confirmation_email(@user, @booking).deliver
    UserNotifierMailer.send_user_bookingrejected_confirmation_email(@user, @booking).deliver
    @booking.destroy
    flash[:notice] = "Booking has been rejected"
    redirect_to root_path
  end

  def confirm
    @booking.confirmed = true
    @booking.save
    @user = User.find(@booking.user_id)
    # UserMailer.send_user_bookingconfirmed_confirmation_email(@user, @booking).deliver
    UserNotifierMailer.send_user_bookingconfirmed_confirmation_email(@user, @booking).deliver
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
