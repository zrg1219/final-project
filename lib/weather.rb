require 'nokogiri'
require 'open-uri'

class Weather

  def initialize
    weather_html = open("http://www.weather.com/weather/today/New+York+NY+10004:4:US")
    @weather_nokogiri = Nokogiri::HTML(weather_html)
  end
  
  def temperature
    @weather_nokogiri.css("div.wx-temperature")[1].text
  end

  def forecast
    @weather_nokogiri.css("div.wx-phrase")[1].text
  end

  def say_forecast
    puts "Today's forecast is #{temperature} and #{forecast}."
  end

end

today = Weather.new