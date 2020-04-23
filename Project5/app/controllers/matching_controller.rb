class MatchingController < ApplicationController

def index
	
end

def timeIntervalToNumberInterval(time)
	

	@helper1 = time.split('-')
	@helper2 = []
	@helper2[0] = @helper1[0].split(':')
	@helper2[1] = @helper1[1].split(':')
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

def overlapDay(array1, array2)
	@answer = false
	array1.each {|intervalArray1|
	@answer = @answer || overlapInterval(intervalArray1, array2) } 
	@answer
end

def overlapWeek(array1, array2)
	@answer = false
	for i in 0...array1.length
		@answer = @answer||overlapDay(array1[i], array2[i])
	end
	@answer
	
end

def scheduleConflict(course, applicant)

@daySchedule = applicant[:schedule].split(';')
@classAppSchedule = []
@daySchedule.each{ |day| 
unless day =~ /\A(\d{2}:\d{2}-\d{2}:\d{2},)*\d{2}:\d{2}-\d{2}:\d{2}\z/
	 day = "00 : 03 - 00 : 04"
end
@classAppSchedule.append(day.split(',').map{|time| timeIntervalToNumberInterval(time)})
}
@classCourseSchedule = []
@courseTime = course[:time]
while(!(@courseTime[0] =~ /\d/)) 
	@courseTime = @courseTime[1..-1]
end
@courseTime = timeIntervalToNumberInterval(@courseTime)
@nil = timeIntervalToNumberInterval("00 : 00 - 00 : 01")
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

def search 
	@courseCandidateArray = []
	@arrayOfCourses = Course.where("course_number = '" + params[:searchCourse] + "'")
	@arrayOfCourses.each{|currentCourse|
		@applicantsFit = Application.where("course_number LIKE '%" + currentCourse[:course_number].to_s + "%'")
		@applicantsFit = @applicantsFit.reject{|applicant| scheduleConflict(currentCourse, applicant)}
		@courseCandidateArray.append([@applicantsFit, currentCourse])}
	end

end
