if Rails.env.development? || Rails.env.production?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    address:        'smtp.mailgun.com',
    port:           '587',
    authentication: :plain,
    user_name:      ENV['MAILGUN_LOGIN'],
    password:       ENV['MAILGUN_PASSWORD'],
    domain:         'kuresov-markit.herokuapp.com',
    enable_starttls_auto: true
  }
end
