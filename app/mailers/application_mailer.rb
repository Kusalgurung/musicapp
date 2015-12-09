class ApplicationMailer < ActionMailer::Base
  default  to: "info@musify.com", from: "info@musify.com"
  layout 'mailer'
end
