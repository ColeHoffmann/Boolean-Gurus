class StudentCoursesController < ApplicationController


	def new

		@student_course = StudentCourse.new
	end


	def index
		#@student_courses = StudentCourse.all
		@student_courses = current_user.student_courses
	end

	def show

	end

	def edit
		@student_course = StudentCourse.find(params[:id])
	end

	def create
		@student_course = StudentCourse.create(student_course_params)
		@student_course.user_id = current_user.id if current_user

		if @student_course.save
			flash[:success] = "Course saved"
			redirect_to student_courses_path
		else
			render 'new'
		end
	end

	def update
		@student_course = StudentCourse.find(params[:id])
		@student_course.update(student_course_params)

		redirect_to user_path(@student_course.user_id)

		

	end



	private
		def student_course_params
			params.require(:student_course).permit(:course_number, :grade)
		end

end
