class AppliedController < ApplicationController

# POST Applied

  def addApplicant
	@parameter1 = params[:appliedCourse]
	#@parameter2 = params[:appliedLastName]
	@parameter3 = params[:appliedPhone]
	#@parameter4 = params[:appliedFirstName]
	@parameter5 = current_user.read_attribute('username') + "@osu.edu"
	@parameter6 = params[:appliedSchedule]
   	@applicant = Apply.new(:course_number => @parameter1, :last_name => current_user.read_attribute('lname'), :phone_number => @parameter3, :first_name => current_user.read_attribute('fname'), :email => @parameter5, :schedule => @parameter6)
	if @applicant.save
		redirect_to action: 'result'
	end 
			
 
	end

def index
	@applicantList = Apply.all
end
def result
	@applicantList = Apply.all
end

def edit
	@application = Apply.find(params[:id])
end
def show
	@application = Apply.find(params[:id])
end
end
