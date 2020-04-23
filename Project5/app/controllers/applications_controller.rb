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

		else 

		end
	end


	private
	def application_params
		params.require(:apply).permit(:course_number, :lname, :fname, :phone_number, :email, :schedule)

	end
	
end
