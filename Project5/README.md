Project 5: 
This project requires rails, mechanize/httparty, nokogiri. All have been added in GEMFILE.

This application scrapes course data for CSE from "https://web.cse.ohio-state.edu/oportal/schedule_display" and stores it in a database. Supports a view containing list of all courses, or only courses satisfying user-typed query based on course number, section, instructor.

The data scraped from the website include:<br />
Course name: includes course number<br />
Multiple sections for each course<br />
Location for each section<br />
Instructor for each section<br />
Section component<br />

**_Instruction_:<br />
Install the required software by running "bundle install" and "yarn install" first.
Before running the rails server, be sure to run "rails db:migrate", followed by "rails db:seed" to first scrape, and store the course data into the database. rails db:seed runs app/model/scraper.rb which contains the code to scrape the data from the url given above.
After running db:seed, run "rails server" to start the sample view and open browser to 127.0.0.1:3000 for the view

** 

This project was completed by:<br />
**Ryan Lannutti<br />
Franklin Ackah<br />
Cole Hoffmann<br />
Colby Sherwood<br />
Yufei Pan<br />
Vlad Akavets<br />
**
