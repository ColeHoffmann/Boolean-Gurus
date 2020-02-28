class Courses < ActiveRecord::Migration[6.0]
#  def self.up
#    create_table :courses do |t|
#      t.column :courseNumber, :integer
#      t.column :courseName, :string
#    end
#  end

  def change
    drop_table :courses
  end
end
