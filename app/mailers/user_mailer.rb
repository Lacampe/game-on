class UserMailer < ApplicationMailer
  def welcome(user)
    @user = user  # Instance variable => available in view
    @greeting = "Hello! I hope you enjoy quickly booking sports venues through game-on booking. Click to get started:"
    @link_url = "https://game-on-le-wagon.herokuapp.com"
    mail(to: @user.email, subject: 'Welcome to Game On Booking')
    # This will render a view in `app/views/user_mailer`!
  end

  def send_user_space_confirmation_email(user, space)
    @user = user
    @space = space
    mail(to: @user.email, subject: 'Space confirmed', from: "Game-On")
  end

  def send_user_booking_confirmation_email(booking, owner, user)
    @booking = booking
    @user = user
    @owner = owner

    mail(to: @user.email, subject: 'You have requested a booking', from: "Game-On")
  end

  def send_owner_booking_confirmation_email(booking, owner, user)
    @booking = booking
    @owner = owner
    @user = user

    mail(to: @user.email, subject: 'Someone has requested a booking', from: "Game-On")
  end

  def send_user_bookingconfirmed_confirmation_email(user, booking)
    @booking = booking
    @user = user

    mail(to: @user.email, subject: 'Booking confirmed', from: "Game-On")
  end

  def send_user_bookingrejected_confirmation_email(user, booking)
    @booking = booking
    @user = user

    mail(to: @user.email, subject: 'Booking rejected', from: "Game-On")
  end
end
