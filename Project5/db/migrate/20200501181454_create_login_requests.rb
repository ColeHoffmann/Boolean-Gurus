class CreateLoginRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :login_requests do |t|
      t.string :fname
      t.string :lname
      t.string :username
      t.string :department

      t.timestamps
    end
  end
end
