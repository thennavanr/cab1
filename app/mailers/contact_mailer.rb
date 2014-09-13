class ContactMailer < ActionMailer::Base
  default from:'meritcarservice@gmail.com' 

  def send_signup_email(contact)
    mail( :to => contact.email, :subject => 'Thanks for registered.' )
  end

end
