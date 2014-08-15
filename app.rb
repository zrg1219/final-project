require 'bundler' #require bundler
Bundler.require #require everything in bundler in gemfile
require 'pry'
require_relative "lib/new.rb"


get '/' do
  IdeaDisplay.make_activities
  @all_ideas = IdeaDisplay.all
  erb :index
end
