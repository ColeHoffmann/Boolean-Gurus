class EditApplies1 < ActiveRecord::Migration[6.0]
  def change
	remove_column :applies, :timestamps
  end
end
