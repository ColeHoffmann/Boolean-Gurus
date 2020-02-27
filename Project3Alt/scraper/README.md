Project 3: Web Scraping
This project requires rails, mechanize/httparty, nokogiri. All have been added in GEMFILE.

This application scrapes course data for CSE from "https://web.cse.ohio-state.edu/oportal/schedule_display" and stores it in a database. 

The data scraped from the website include:
Course name: includes course number
Multiple sections for each course
Location for each section
Instructor for each section
Section component.

Before running the rails server, be sure to run "rails db:seed" to first scrape, and store the course data into the database. rails db:seed runs app/model/scraper.rb which contains the code to scrape the data from the url given above. 

This project was completed by:
Ryan Lannutti
Franklin Ackah
Cole Hoffmann
Colby Sherwood
Yufei Pan
Vlad Akavets

