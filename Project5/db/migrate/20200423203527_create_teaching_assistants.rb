class CreateTeachingAssistants < ActiveRecord::Migration[6.0]
  def change
    create_table :teaching_assistants do |t|
      t.integer :course_number
      t.integer :section_number
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
