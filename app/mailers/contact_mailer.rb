class ContactMailer < ActionMailer::Base
  default from: "k.aswinii@gmail.com"

  def send_signup_email(contact)
    mail( :to => contact.email, :subject => 'Thanks for registered.' )
  end

end
