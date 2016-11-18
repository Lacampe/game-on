class UserMailer < ApplicationMailer
  def welcome(user)
    @user = user  # Instance variable => available in view
    @greeting = "Hello! I hope you enjoy quickly booking sports venues through game-on booking. Click to get started:"
    @link_url = "https://game-on-le-wagon.herokuapp.com"
    mail(to: @user.email, subject: 'Welcome to Game On Booking')

    # This will render a view in `app/views/user_mailer`!
  end

  def send_user_booking_confirmation_email(booking)
    @booking = booking
  end

  def send_owner_booking_confirmation_email(booking)
    @booking = booking
  end
end
