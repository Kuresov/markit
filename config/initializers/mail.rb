if Rails.env.development? || Rails.env.production?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    address:        'smtp.mailgun.org',
    port:           465,
    authentication: :plain,
    user_name:      ENV['MAILGUN_SMTP_LOGIN'],
    password:       ENV['MAILGUN_SMTP_PASSSWORD'],
    domain:         'heroku.com',
    enable_starttls_auto: true
  }
end
