Project 3: Web Scraping
This project requires rails, bundler, mechanize, nokogiri
By:
gem install rails
gem install bundler
gem install nokogiri
gem install mechanize

Needed data types:
Table: classes
ID
Class Number - required -integer
Course number - external key -ID
Class Name -string
location -string
time -string
instructor -string
Session length - char - '1' for first session, '2' for second session, 'f' for full term
term -string
class component -string
Related Classes - Array of IDs (one to many)


Table: Courses
Course number - required, id
Course name - string
Classes - external key - array of IDs (one to many)

