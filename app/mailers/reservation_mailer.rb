class ReservationMailer < ActionMailer::Base
<<<<<<< HEAD
  default from: 'k.aswinii@gmail.com'
=======
  default from:'k.aswinii@gmail.com' 
>>>>>>> de221cbf3b12e8befd1671dc2e84578734de1edd

  def register_email(reservation)
    @reservation=reservation
    headers["Reply_to"]=ENV["MAIL_USERNAME"]
    headers["Return_path"]=ENV["MAIL_USERNAME"]

binding.pry

    mail( :to => reservation.email, :subject => 'Cab Booking Confirmation.' )
  end


end
