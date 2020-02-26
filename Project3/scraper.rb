require 'mechanize'
require 'nokogiri'
require 'httparty'

def scraper
  
  url = "https://web.cse.ohio-state.edu/oportal/schedule_display"
#  agent = Mechanize.new
#  page = agent.get(url)
  page = HTTParty.get(url)
  noko_page = Nokogiri::HTML(page)
  
  courses = noko_page.css('div.panel.panel-default')
  courses.each do |course|
    title = course.css('a').text
    section = course.css('table.table.table-condensed')
    #loop through sections to get section info

  end

end

scraper
