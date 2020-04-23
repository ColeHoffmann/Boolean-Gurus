class ChangeTypetoRecTypeinRecommendations < ActiveRecord::Migration[6.0]
  def change
    change_table :recommendations do |t|
      t.rename :type, :rec_type
    end
  end
end
