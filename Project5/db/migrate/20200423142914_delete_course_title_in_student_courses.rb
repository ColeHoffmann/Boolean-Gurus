class DeleteCourseTitleInStudentCourses < ActiveRecord::Migration[6.0]
  def change
    remove_column :student_courses, :title, :string
  end
end
