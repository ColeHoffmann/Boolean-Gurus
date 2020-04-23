class AddUserNametoRecommendations < ActiveRecord::Migration[6.0]
  def change
    add_column :recommendations, :ins_username, :string
  end
end
