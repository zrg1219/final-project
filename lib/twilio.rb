require 'rubygems'
require 'twilio-ruby'
require_relative 'new.rb'

class Texts

  def send_text(x)
  IdeaDisplay.make_activities
  # put your own credentials here
  account_sid = 'ACe330ba04d082392df4cb3511dcb72cec'
  auth_token = '2008ea097713e401a16c54029058da82'

  # set up a client to talk to the Twilio REST API
  @client = Twilio::REST::Client.new account_sid, auth_token

  @client.account.messages.create(
    :from => '+18152642023',
    :to => x,
    :body => "Don't be lazy, go do this today: #{IdeaDisplay.all.sample.activity}"
    )
  end
end


