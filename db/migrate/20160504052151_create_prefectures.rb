class CreatePrefectures < ActiveRecord::Migration
  def change
    create_table :prefectures do |t|
      t.string :ken
      t.timestamps
    end
  end
end
