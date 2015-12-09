# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview
  def contact_email
    ContactMailer.contact_email("kusalgurung@hotmail.com",
      "Kusal Gurung", "1234567890", @message = "I was not able to add a album")
  end

end
