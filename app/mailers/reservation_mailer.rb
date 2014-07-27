class ReservationMailer < ActionMailer::Base
  default from: ENV["MAIL_USERNAME"]

  def register_email(reservation)
    @reservation=reservation

    mail( :to => reservation.email, :subject => 'Thanks for registered.' )
  end


end
