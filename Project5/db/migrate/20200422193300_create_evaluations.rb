class CreateEvaluations < ActiveRecord::Migration[6.0]
  def change
    create_table :evaluations do |t|
      t.string :ins_fname
      t.string :ins_lname
      t.string :ins_username
      t.integer :rating
      t.string :evaluation
      t.string :ta_fname
      t.string :ta_lname
      t.string :ta_username

      t.timestamps
    end
  end
end
