class ApplicationsController < ApplicationController

	def new 

		@application = Application.new

	end

	def index
		@applicaions = Application.all
	end

		

	def edit

	end

	def show

	end

	def create
		@application = Application.create(application_params)
		@application.user_id = current_user.id if current_user

		if @application.save 
			redirect_to applications_path
		else 
			render "new"
		end
	end


	private
	def application_params
		params.require(:application).permit(:course_number, :lname, :fname, :phone_number, :email, :schedule)

	end
	
end
