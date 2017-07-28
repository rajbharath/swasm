Recaptcha.configure do |config|
  config.secret_key  = ENV['RECAPTCHA_SECRET_KEY']
  config.site_key = ENV['RECAPTCHA_SITE_KEY']
  config.verify_url = 'https://www.google.com/recaptcha/api/siteverify'
end
