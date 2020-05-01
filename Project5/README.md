Project 5:


This project requires rails, mechanize/httparty, nokogiri, Bootstrap, Jquery, bycrypt. All have been added in GEMFILE.
Run bundle install
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


DEFAULT ADMIN PASSWORD IS ADMIN, USERNAME ADMIN!!!

For our app, signup on the website can only be done by students. Instructor signups can only be done by the admin. This is to prevent anyone from signing up as 
an admin and having access to privileged information. 
Once signed in, students can view courses offered and apply for TA positions. Students are required to provide grades for courses they wish to apply for.
Once signed in, instructors can request for specific TAs if they're available. Instructors can also recommend TAs for other TA positions. After the semester, 
instructs can write an evaluation based on the performance of a TA.
Once signed in, admin can create/delete a new user, student and Instructor. Admins can assign TA postions. Admins can view recommendations, applications for TA
postions, evaluations. Admins can utilize the TA matching algorithm to find suitable TAs for courses.

** 

This project was completed by:<br />
**Ryan Lannutti<br />
Franklin Ackah<br />
Cole Hoffmann<br />
Colby Sherwood<br />
Yufei Pan<br />
Vlad Akavets<br />
**

Our slides for our final presenation can be found at this link: https://docs.google.com/presentation/d/1qmQaGTClndrkYV-zCVKiF1Fk8xXBKdXEhpgjZPN1qiA/edit?usp=sharing
