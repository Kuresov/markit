class ApplicationMailer < ActionMailer::Base
  default from: "postmaster@app3efb071030fe4d83850e757afc71e9b1.mailgun.org"
  layout 'mailer'
end
