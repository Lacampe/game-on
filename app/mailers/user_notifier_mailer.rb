class UserNotifierMailer < ApplicationMailer
  def send_user_booking_confirmation_email(booking, user)
    @booking = booking
    @user = user

    mail(to: @user.email)
  end

  def send_owner_booking_confirmation_email(booking, owner)
    @booking = booking
    @owner = owner

    mail(to: @owner.email)
  end

  def send_owner_bookingrejected_confirmation_email(booking)
    @booking = booking

    mail(to: booking.space.user.email)
  end

  def send_signup_email(user)
    @user = user

    mail(to: user.email)
  end

  def send_user_bookingconfirmed_confirmation_email(booking)
    @booking = booking

    mail(to: booking.user.email)
  end

  def send_user_bookingrejected_confirmation_email(booking)
    @booking = booking

    mail(to: booking.user.email)
  end
end

