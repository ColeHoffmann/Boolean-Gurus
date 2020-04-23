class MoveEmailandPhoneNumberFromApplicationsToUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :applications, :phone_number, :string
    remove_column :applications, :email, :string
    add_column :users, :phone_number, :string
    add_column :users, :email, :string

  end
end
