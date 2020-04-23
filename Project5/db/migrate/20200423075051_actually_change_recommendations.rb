class ActuallyChangeRecommendations < ActiveRecord::Migration[6.0]
  def change
    drop_table :recommendations
    create_table :recommendations do |t|
      t.string :ins_fname
      t.string :ins_lname
      t.string :student_fname
      t.string :student_lname
      t.string :course_number
      t.string :section_number
      t.string :type

      t.timestamps
    end
  end
end
