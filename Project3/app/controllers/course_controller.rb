class CourseController < ApplicationController
  def list
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
  end

end
