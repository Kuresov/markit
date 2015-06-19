if Rails.env.development? || Rails.env.production?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    address:        'smtp.mailgun.org',
    port:           '587',
    authentication: :plain,
    user_name:      ENV['MAILGUN_LOGIN'],
    password:       ENV['MAILGUN_PASSWORD'],
    domain:         'app3efb071030fe4d83850e757afc71e9b1.mailgun.org',
    enable_starttls_auto: true
  }
end
