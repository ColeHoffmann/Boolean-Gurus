class CreateApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :applications do |t|
      t.integer :course_number
      t.string :lname
      t.string :fname
      t.string :phone_number
      t.string :email
      t.string :schedule

      t.belongs_to :user, index: :true

      t.timestamps
    end
  end
end
