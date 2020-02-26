require 'mechanize'
require 'nokogiri'
require 'httparty'
require 'byebug'

def scraper
  
  url = "https://web.cse.ohio-state.edu/oportal/schedule_display"
#  agent = Mechanize.new
#  page = agent.get(url)
  page = HTTParty.get(url)
  noko_page = Nokogiri::HTML(page)
   
  courses = noko_page.css('div.panel.panel-default')
  courses.each do |course|
    title = course.css('a').text
    sections = course.css('tr')
    #loop through sections to get section info
    #ignore first and last sections
    sections.each do |section|
      puts section.text
    end
  end

end

scraper
