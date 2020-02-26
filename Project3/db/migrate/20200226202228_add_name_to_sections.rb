class AddNameToSections < ActiveRecord::Migration[6.0]
  def change
    create_table :sections do |t|
      t.column :sectionNumber, :integer
      t.column :courseNumber, :integer
      t.column :location, :string
      t.column :time, :string
      t.column :instructor, :string
      t.column :sessionLength, :string
      t.column :sectionComponent, :string
    end
  end
end
