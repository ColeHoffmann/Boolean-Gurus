require 'mechanize'
require 'nokogiri'
require 'httparty'


def scraper
  
  url = "https://web.cse.ohio-state.edu/oportal/schedule_display"
#  agent = Mechanize.new
#  page = agent.get(url)
  #  i was having issues with mechanize so i used httparty
  #  feel free to try mechanize just comment out httparty and un-comment agent and page for mechanize
  page = HTTParty.get(url)
  noko_page = Nokogiri::HTML(page)
   
  courses = noko_page.css('div.panel.panel-default')
  courses.each do |course|
    title = course.css('a').text
    sections = course.css('tr.group0') + course.css('tr.group1')
    #loop through sections to get section info
    sections.each do |section|
      a = section.css('td')
     # puts a.text
      section_number = a[0].text
      section_component = a[1].text
      section_location = a[2].text
      section_times = a[3].text
      section_instructor = a[4].text
      section_session = a[4].text
      section_topic = a[5].text
    end
  end

end

scraper
