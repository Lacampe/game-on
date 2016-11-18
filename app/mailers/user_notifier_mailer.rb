class UserNotifierMailer < ApplicationMailer
  def send_user_space_confirmation_email(user, space)
    @user = user
    @space = space
    mail(to: @user.email)
  end

  def send_user_booking_confirmation_email(booking, owner, user)
    @booking = booking
    @user = user
    @owner = owner

    mail(to: @user.email)
  end

  def send_owner_booking_confirmation_email(booking, owner, user)
    @booking = booking
    @owner = owner
    @user = user

    mail(to: @owner.email)
  end

  def send_user_bookingconfirmed_confirmation_email(user, booking)
    @booking = booking
    @user = user

    mail(to: @user.email)
  end

  def send_user_bookingrejected_confirmation_email(user, booking)
    @booking = booking
    @user = user

    mail(to: @user.email)
  end
end

