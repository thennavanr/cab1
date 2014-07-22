class ReservationMailer < ActionMailer::Base
  default from: "k.aswinii@gmail.com"

  def register_email(reservation)
    @reservation=reservation

    mail( :to => reservation.email, :subject => 'Thanks for registered.' )
  end


end
