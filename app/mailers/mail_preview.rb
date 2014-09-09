class MailPreview < MailView

  def reservation
    r = Reservation.find(41)
    mail = ReservationMailer.register_email(r)

  end

  def contact
    c = Contact.find(1)
     ContactMailer.send_signup_email(c)
  end 
  
end
