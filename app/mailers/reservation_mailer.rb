class ReservationMailer < ActionMailer::Base
  default from:'meritcarservice@gmail.com' 

  def register_email(reservation)
    @reservation=reservation
    headers["Reply_to"]=ENV["MAIL_USERNAME"]
    headers["Return_path"]=ENV["MAIL_USERNAME"]

    mail( :to => reservation.email, :subject => 'Cab Booking Confirmation.' )
  end

  def booking_alert r

    @reservation= r
    headers["Reply_to"]=ENV["MAIL_USERNAME"]
    headers["Return_path"]=ENV["MAIL_USERNAME"]

    mail( :to => 'meritcarservice@gmail.com', :subject => 'New Booking Recieved.' )
  end


end
