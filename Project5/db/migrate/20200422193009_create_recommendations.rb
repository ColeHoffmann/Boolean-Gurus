class CreateRecommendations < ActiveRecord::Migration[6.0]
  def change
    create_table :recommendations do |t|
      t.string :ins_fname
      t.string :ins_lname
      t.string :ins_username
      t.string :type
      t.string :recommendation
      t.string :ta_fname
      t.string :ta_lname
      t.string :ta_username

      t.timestamps
    end
  end
end
