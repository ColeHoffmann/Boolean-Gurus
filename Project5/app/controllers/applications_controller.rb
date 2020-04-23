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

		redirect_to applications_path

		

	end

	def destroy
		Application.find(params[:id]).destroy

		redirect_to applications_path

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
		params.require(:application).permit(:course_number, :schedule)

	end
	
end
