if Rails.env.development?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    address: 'smtp.mailgun.org',
    port: '587',
    authentication: :plain,
    content_type: 'text/html',
    user_name: ENV['MAILGUN_LOGIN'],
    password: ENV['MAILGUN_PASS'],
    domain: 'kuresov-markit.herokuapp.com',
    enable_starttls_auto: true
  }
end
