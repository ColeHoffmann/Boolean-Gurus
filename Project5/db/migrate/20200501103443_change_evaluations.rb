class ChangeEvaluations < ActiveRecord::Migration[6.0]
  def change
    drop_table :evaluations
    create_table :evaluations do |t|
      t.string :rating
      t.string :evaluation
      t.string :student_fname
      t.string :student_lname
      t.string :student_username
      t.string :course_number
      t.string :ins_id

      t.timestamps
    end
  end
end
