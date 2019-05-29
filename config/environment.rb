# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

#ActionMailer MailJet
ActionMailer::Base.smtp_settings = {
  :user_name => ENV['API key'],
  :password => ENV['API secret'],
  :domain => 'https://projet-felix-le-chat.herokuapp.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
