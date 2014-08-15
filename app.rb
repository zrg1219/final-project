require 'bundler' #require bundler
Bundler.require #require everything in bundler in gemfile
require 'pry'
require_relative "lib/new.rb"
require_relative "lib/twilio.rb"
require_relative "lib/mailgun.rb"



get '/' do
  IdeaDisplay.make_activities
  @all_ideas = IdeaDisplay.all
  erb :index
end

post '/' do
  IdeaDisplay.make_activities
  @all_ideas = IdeaDisplay.all
 if params[:phone_number] != nil
    new = Texts.new
   new.send_text(params[:phone_number])
  end
  if params[:email_address] !=nil
   news = Emails.new
   news.send_email(params[:email_address])
  end
  erb :index
end

