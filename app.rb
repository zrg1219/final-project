require 'bundler' #require bundler
Bundler.require #require everything in bundler in gemfile
require 'pry'
require_relative "lib/new.rb"
require_relative "lib/twilio.rb"


get '/' do
  IdeaDisplay.make_activities
  @all_ideas = IdeaDisplay.all
  erb :index
end

post '/' do
  IdeaDisplay.make_activities
  @all_ideas = IdeaDisplay.all
  new = Texts.new
  new.send_text(params[:phone_number])
  erb :index
end
