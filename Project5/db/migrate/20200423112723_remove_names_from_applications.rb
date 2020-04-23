class RemoveNamesFromApplications < ActiveRecord::Migration[6.0]
  def change

    remove_column :applications, :fname, :string

    remove_column :applications, :lname, :string
  end
end
