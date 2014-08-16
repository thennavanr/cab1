class ReservationMailer < ActionMailer::Base
  default from:'k.aswinii@gmail.com' 

  def register_email(reservation)
    @reservation=reservation
    headers["Reply_to"]=ENV["MAIL_USERNAME"]
    headers["Return_path"]=ENV["MAIL_USERNAME"]


    mail( :to => reservation.email, :subject => 'Cab Booking Confirmation.' )
  end


end
