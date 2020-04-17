class DropApply < ActiveRecord::Migration[6.0]
  def change
	drop_table :apply
  end
end
