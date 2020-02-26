Project 3: Web Scraping
This project requires rails, bundler, mechanize, nokogiri
By:
gem install rails
gem install bundler
gem install nokogiri
gem install mechanize

Needed data types:
Table: section
ID
sectionNumber - required -integer
Course number - external key
location -string
time -string
instructor -string
Session length - string - '1' for first session, '2' for second session, 'f' for full term
term -string
Section component -string
Related Sections - Array of IDs (one to many)


Table: Courses
ID
Course number - required
Course name - string
Sections - external key - array of IDs (one to many)

