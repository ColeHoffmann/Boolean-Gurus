class SectionController < ApplicationController
  def list
    @sections = Section.all
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new
    @courses = Course.all
  end

  def section_params
    params.require(:sections).permit(:sectionNumber, :courseNumber, :location, :time, :instructor, :sessionLength, sectionComponent)
  end

  def create
    @section = Section.new(section_params)

    if @section.save
      redirect_to :action => 'list'
    else
      @courses = Course.all
      render :action => 'new'
    end
  end

  def edit
    @section = Section.find(params[:id])
    @courses = Course.all
  end

  def update
    @section = Section.find(params[:id])

    if @section.update_attributes(section_param)
      redirect_to :action => 'show', :id => @section
    else
      @courses = Courses.all
      render :action => 'edit'
    end
  end

  def section_param
    params.require(:section).permit(:sectionNumber, :courseNumber, :location, :time, :instructor, :sessionLength, sectionComponent)
  end

  def delete
    Section.find(params[:id]).destroy
    redirect_to :action => 'list'
  end

  def showCourses
    @course = Course.find(params[:id])
  end

end
