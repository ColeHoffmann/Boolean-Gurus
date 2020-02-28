class AddNameToCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.column :courseNumber, :integer
      t.column :courseName, :string
    end
  end
end
