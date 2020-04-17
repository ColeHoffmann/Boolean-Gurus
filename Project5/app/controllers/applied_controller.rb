class AppliedController < ApplicationController

# POST Applied

def applied_params
	params.permit(:course_number, :last_name, :phone_number)
end

 def addApplicant
	@parameter1 = params[:appliedCourse]
	#@parameter2 = params[:appliedLastName]
	@parameter3 = params[:appliedPhone]
	#@parameter4 = params[:appliedFirstName]
	@parameter5 = params[:appliedEmail]
	@parameter6 = params[:appliedSchedule]
   	@applicant = Apply.new(:course_number => @parameter1, :last_name => current_user.read_attribute('lname'), :phone_number => @parameter3, :first_name => current_user.read_attribute('fname'), :email => @parameter5, :schedule => @parameter6)
	if @applicant.save
		redirect_to action: 'result'
	end
			
 
 end

def result
	@applicantList = Apply.all
end

end
