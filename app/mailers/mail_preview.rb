class MailPreview < MailView

  def reservation
    r = Reservation.find(10)
    mail = ReservationMailer.register_email(r)

  end

  def contact
    c = Contact.find(10)
     ContactMailer.send_signup_email(c)
  end 

  def booking_alert
    r = Reservation.find(10)
    mail = ReservationMailer.booking_alert(r)
  end
  
end
