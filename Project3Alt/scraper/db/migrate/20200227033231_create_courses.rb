class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.text :title
      t.integer :section_number
      t.string :component
      t.string :location
      t.string :time
      t.string :instructor
      t.string :session

      t.timestamps
    end
  end
end
