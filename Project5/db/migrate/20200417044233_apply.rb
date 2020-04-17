class Apply < ActiveRecord::Migration[6.0]
  def change
    create_table :apply do |t|
         t.column :last_name, :string, :limit => 32, :null => false
         t.column :course_number, :integer
         t.column :phone_number, :string

    end
  end
end
