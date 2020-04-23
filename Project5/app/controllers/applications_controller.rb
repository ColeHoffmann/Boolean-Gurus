class ApplicationsController < ApplicationController

	def new 

		@application = Application.new

	end

	def index
		@applicaions = Application.all
	end

		

	def edit
		@application = Application.find(params[:id])
	end

	def update
		@application = Application.find(params[:id])
		@application.update(application_params)

		if current_user.affiliation == "Student"
			redirect_to my_applications_path
		else
			redirect_to applications_path
		end
		

	end

	def destroy
		Application.find(params[:id]).destroy

		if current_user.affiliation == "Student"
			redirect_to my_applications_path
		else
			redirect_to applications_path
		end

	end

	def show

	end



	def create
		@application = Application.create(application_params)
		@application.user_id = current_user.id if current_user

		if @application.save 
			redirect_to my_applications_path
		else 
			render "new"
		end
	end

	def my_application
		@my_application = current_user.applications   	
	end


	private
	def application_params
		params.require(:application).permit(:course_number, :lname, :fname, :phone_number, :email, :schedule)

	end
	
end
