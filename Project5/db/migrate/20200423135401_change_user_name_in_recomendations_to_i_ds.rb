class ChangeUserNameInRecomendationsToIDs < ActiveRecord::Migration[6.0]
  def change
    change_table :recommendations do |t|
      t.rename :ins_username, :ins_id
    end
  end
end
