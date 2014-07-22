class ReservationMailer < ActionMailer::Base
  default from: "'from@example.com'

  def register_email(reservation)
    @reservation=reservation

    mail( :to => reservation.email, :subject => 'Thanks for registered.' )
  end


end
