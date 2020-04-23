class CreateStudentCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :student_courses do |t|
      t.string :title
      t.integer :course_number
      t.string :grade
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
