class ReservationMailer < ActionMailer::Base
  default from:'meritcarservice@gmail.com' 

  def register_email(reservation)
    @reservation=reservation
    mail( :to => reservation.email, :subject => 'Cab Booking Confirmation.' )
  end

  def booking_alert r
    @reservation= r
    mail( :to => 'meritcarservice@gmail.com', :subject => 'New Booking Recieved.' )
  end


end
