class MatchingController < ApplicationController

skip_before_action :verify_authenticity_token

def index
	
end

# parses a nn:nn-nn:nn formatted time interval to a more convenient (start,end) form where start, end are integers representing number of minutes passed from 00:00 (point in time as interval from a fixed point) 
def timeIntervalToNumberInterval(time)
	@helper1 = time.split('-')
	@helper2 = []
	@helper2[0] = @helper1[0].split(':')
	@helper2[1] = @helper1[1].split(':')
# next block deals with possibilities that hours or minutes started from zero, like 08:09 which would mess up the to_i function
	if (@helper2[0][0][0] == "0")
		@helper2[0][0] = @helper2[0][0][1,-1]
	end
	if (@helper2[0][1][0] == "0")
		@helper2[0][1] = @helper2[0][1][1,-1]
	end
	if (@helper2[1][0][0] == "0")
		@helper2[1][0] = @helper2[1][0][1,-1]
	end
	if (@helper2[1][1][0] == "0")
		@helper2[1][1] = @helper2[1][1][1,-1]
	end


	@answer = []
	@answer[0] = @helper2[0][0].to_i*60 + @helper2[0][1].to_i
	@answer[1] = (@helper2[1])[0].to_i*60 + (@helper2[1])[1].to_i
	@answer

end

# Checks whether two given time intervals overlap 
def overlapInterval (array1, array2)
	@answer = false
	@a = array1[0] <= array2[0]
	@b = array1[1] > array2[0]
	@c = array1[0] > array2[0]
	@d = array1[0] < array2[1]
	if ((@a&&@b)||(@c&&@d))
		@answer = true
	end
	@answer
	
end

# Checks whether two daily schedules overlap
def overlapDay(array1, array2)
	@answer = false
	array1.each {|intervalArray1|
	@answer = @answer || overlapInterval(intervalArray1, array2) } 
	@answer
end

# Checks whether two given weekly schedules overlap. Calls overLapDay for each day of the week
def overlapWeek(array1, array2)
	@answer = false
	for i in 0...array1.length
		@answer = @answer||overlapDay(array1[i], array2[i])
	end
	@answer
	
end

# Checks whether course times and schedule of a given applicant overlap 
def scheduleConflict(course, applicant)
	# splits applicant schedule into information about individual days
	@daySchedule = applicant[:schedule].split(';')
	@classAppSchedule = []
	# fills in info for days with schedule not given by some values which are not supposed to trigger any overlaps
	@daySchedule.each{ |day| 
	unless day =~ /\A(\d{2}:\d{2}-\d{2}:\d{2},)*\d{2}:\d{2}-\d{2}:\d{2}\z/
		day = "00 : 03 - 00 : 04"
	end
	# reformats schedule with values which are easier to work with
	@classAppSchedule.append(day.split(',').map{|time| timeIntervalToNumberInterval(time)})}
	@classCourseSchedule = []
	# obtains and reformats class time. Here we assume each class has same time different week days, because if it has different times, they would be split into different instances by our schema, and thus handled by this function separately. 
	@courseTime = course[:time]
	if (@courseTime == "ARR")
		@courseTime = "00 : 00 - 00 : 01"
	end
	while(!(@courseTime[0] =~ /\d/)) 
		@courseTime = @courseTime[1..-1]
	end
	@courseTime = timeIntervalToNumberInterval(@courseTime)
	@nil = timeIntervalToNumberInterval("00 : 00 - 00 : 01")
	# append course time if there is a class that day, otherwise append nil time, which will cause no overlaps
	if (course[:time].include?("M"))
 		@classCourseSchedule.append(@courseTime)

	else 
		@classCourseSchedule.append(@nil)
	end
	if (course[:time].include?("T") )
		@classCourseSchedule.append(@courseTime)

	else 
		@classCourseSchedule.append(@nil)
	end
	if (course[:time].include?("W")) 
		@classCourseSchedule.append(@courseTime)

	else 
		@classCourseSchedule.append(@nil)
	end
	if (course[:time].include?("R")) 
		@classCourseSchedule.append(@courseTime)

	else 
		@classCourseSchedule.append(@nil)
	end
	if (course[:time].include?("F")) 
		@classCourseSchedule.append(@courseTime)

	else 
		@classCourseSchedule.append(@nil)
	end


	overlapWeek(@classAppSchedule, @classCourseSchedule)


end

# Checks whether student has a recommendation for a given course 
def hasRecommendation(course, fname, lname)
	@recommendations = Recommendation.where("course_number LIKE " + course.to_s + " AND student_fname LIKE '" + fname + "' AND student_lname LIKE '" + lname + "'")
	@answer = @recommendations.length > 0
end

# Finds all the students available for TAing a particular course, based on the fact that they applied and that they fit a particular section schedule availability. Removes current TA from the list (he is handled separately), puts students with recommendations first.
def search 
	@courseCandidateArray = []
	# find all sections of the course given. Group sections which are split into few (if they have more than one instructor or more than 1 class time given, like lab and lecture different) together
	@arrayOfCourses = Course.where("course_number = '" + params[:searchCourse] + "'").group(:section_number)
	@arrayOfCourses.each{|currentCourse|
		# create multisection variable, which will account for sections split as above
		@multiSection = Course.where("course_number = '" + currentCourse[:course_number].to_s + "' AND section_number = '" + currentCourse[:section_number].to_s + "'")
		# find all students who applied for the course, then filter only those who fit section times
		@applicantsFit = Application.where("course_number LIKE '%" + currentCourse[:course_number].to_s + "%'")
		@applicantsFit = @applicantsFit.reject{|applicant|
			@ans = false
			@multiSection.each { |current|
				@ans = @ans || scheduleConflict(current, applicant)
 			}
 			@ans
		}
	# remove current TA from the list (if any) because he is handled separately
	@courseToUpd = TeachingAssistant.where("course_number LIKE "  + currentCourse[:course_number].to_s + " AND section_number LIKE " + currentCourse[:section_number].to_s)
	if (@courseToUpd.length > 0)
		@applicantsFit = @applicantsFit.reject{|applicant| applicant[:user_id] == @courseToUpd[0][:user_id] }

	end
	# sort, so that students with recommendations come first
	@applicantsFit = @applicantsFit.sort_by{|a| 
		@b = User.where("id = '" + a[:user_id].to_s + "'")
		hasRecommendation(currentCourse[:course_number], @b[0][:fname], @b[0][:lname]) ? 0:1}
	@courseCandidateArray.append([@applicantsFit, currentCourse])}
end


# adds TA to a course, if course had no TA previously. Otherwise updates the existing one. Redirects to page containing all current TA's
def changeTA
	@courseToUpd = TeachingAssistant.where("course_number LIKE "  + 	params[:course] + " AND section_number LIKE " + params[:section])

	if (@courseToUpd.length > 0) 
	
		@courseToUpd[0].update(:user_id => params[:userID])
	else 
		@newRelation = TeachingAssistant.create(:user_id => 		params[:userID], :course_number => 			  	params[:course], :section_number => params[:section])
		@newRelation.save
		
	end
	redirect_to "/teaching_assistants"
end

# deletes assigned to a course TA, requires course having a TA. Redirects to page containing all current TA's
def deleteTA
	TeachingAssistant.where("course_number LIKE " + 		params[:course].to_s + " AND section_number LIKE " + params[:section].to_s + " AND user_id LIKE " + params[:userID].to_s).destroy_all
	redirect_to "/teaching_assistants"	
end



end
