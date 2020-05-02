class ChangeTeachingAssistantCourseNumberType < ActiveRecord::Migration[6.0]
  def change
	change_column :teaching_assistants, :course_number, :string
  end
end
