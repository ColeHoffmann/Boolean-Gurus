class DeleteInsNamesFieldsFromRecommendations < ActiveRecord::Migration[6.0]
  def change
    remove_column :recommendations, :ins_fname, :string
    remove_column :recommendations, :ins_lname, :string
  end
end
