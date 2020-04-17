class ApplyUpdate < ActiveRecord::Migration[6.0]
  def change
	add_column :applies, :first_name, :string
	add_column :applies, :email, :string
	add_column :applies, :schedule, :string
  end
end
