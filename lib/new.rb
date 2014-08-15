require 'nokogiri'
require 'open-uri'

class IdeaScrape

  def initialize
    idea_html = open("http://opishposh.com/101-things-to-do-when-youre-bored-at-home/")
    @idea_nogokiri = Nokogiri::HTML(idea_html)
  end

  def ideas_array
    ideas_array =[]
    @idea = @idea_nogokiri.css("ol.spaced li").each do |i|
       ideas_array <<  i.children.children.text
   end
  ideas_array
  end

end

class IdeaDisplay
  def activity=(a)
    @activity = a
  end

  def activity
    @activity
  end

  def self.make_activities
    new = IdeaScrape.new
    x = 0
    new.ideas_array.each do |item|
      x += 1
      a = x
      a = IdeaDisplay.new
      a.activity = item
    end
  end

  #returns an array that contains all of the instances of IdeaDisplay class
  def self.all
    ObjectSpace.each_object(self).to_a
  end

end





