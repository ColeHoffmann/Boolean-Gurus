class AddEmailToLoginRequest < ActiveRecord::Migration[6.0]
  def change
    add_column :login_requests, :email, :string
  end
end
