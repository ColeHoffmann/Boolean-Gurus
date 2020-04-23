class AddUserRefToApplies < ActiveRecord::Migration[6.0]
  def change
    add_reference :applies, :user, null: true, foreign_key: true
  end
end
