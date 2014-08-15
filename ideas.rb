require 'nokogiri'
require 'open-uri'

html = open('https://www.goodreads.com/topic/show/938017-1-000-random-things-to-do-when-you-are-bored')

nokogiri = Nokogiri::HTML(html)

idea_1 = nokogiri.css("#comment_53068753 > div.mediumText.reviewText").text.gsub(/\s+/, " ")

idea_2 = nokogiri.css("#comment_53069027 > div.mediumText.reviewText").text.gsub(/\s+/, " ")

ideas_array = []
ideas = nokogiri.css("div.mediumText.reviewText").each do |idea|
  ideas_array << idea.children[-4].text
  puts ideas_array
end

actual_ideas = []
ideas_array.each do |idea|
  idea.strip!.gsub!("\n", "")
  if idea.start_with?("1", "2", "3", "4", "5", "6", "7", "8", "9")
    actual_ideas << idea
  end
end

puts actual_ideas

# html_2 = open('https://www.goodreads.com/topic/show/938017-1-000-random-things-to-do-when-you-are-bored?page=2')
# nokogiri_2 = Nokogiri::HTML(html_2)

# loop so repeats the same steps in ideas_array and actual_ideas for pages 2-15



# write a regular expression that uncludes the numbers 1-27 and then split on that regular expression





