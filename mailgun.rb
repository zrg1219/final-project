require 'mailgun'
require_relative 'new.rb'


# Initialize your Mailgun object:
Mailgun.configure do |config|
  config.api_key = 'key-1bfb87f7d64abf4a4e2d4b216554a9c0'
  config.domain  = 'sandbox0c4eb182732e4d0db76e73edd27c9d4b.mailgun.org'
end

@mailgun = Mailgun()

# or alternatively:
@mailgun = Mailgun(:api_key => 'your-api-key')

parameters = {
  :to => "cooldev@your.mailgun.domain",
  :subject => "missing tps reports",
  :text => "yeah, we're gonna need you to come in on friday...yeah.",
  :from => "postmaster@sandbox0c4eb182732e4d0db76e73edd27c9d4b.mailgun.org"
}
@mailgun.messages.send_email(parameters)


