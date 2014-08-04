class ContactMailer < ActionMailer::Base
  default from: "ENV['MAIL_USERNAME']"

  def send_signup_email(contact)
    mail( :to => contact.email, :subject => 'Thanks for registered.' )
  end

end
