require_relative 'new.rb'
require 'mailgun'

class Emails
  
  Mailgun.configure do |config|
    config.api_key = 'key-1bfb87f7d64abf4a4e2d4b216554a9c0'
    config.domain  = 'sandbox0c4eb182732e4d0db76e73edd27c9d4b.mailgun.org'
  end

 def send_email(x)
  # Initialize your Mailgun object:


  # or alternatively:
  @mailgun = Mailgun(:api_key => 'your-api-key')
  IdeaDisplay.make_activities

  parameters = {
    :to => x,
    :subject => "GET UP AND DO SOMETHING!!!",
    :text => "Don't be lazy, go do this today: #{IdeaDisplay.all.sample.activity}",
    :from => "postmaster@sandbox0c4eb182732e4d0db76e73edd27c9d4b.mailgun.org"
  }

  @mailgun.messages.send_email(parameters)
 end

end
