Project 3: Web Scraping
This project requires rails, bundler, mechanize, nokogiri
By:
gem install rails
gem install bundler
gem install nokogiri
gem install mechanize

Needed data types:
Table: Section
ID
Section Number - required -integer
Course number - external key -ID
location -string
time -string
instructor -string
Session length - char - '1' for first session, '2' for second session, 'f' for full term
term -string
Section component -string
Related Sections - Array of IDs (one to many)


Table: Courses
Course number - required, id
Course name - string
Sections - external key - array of IDs (one to many)

