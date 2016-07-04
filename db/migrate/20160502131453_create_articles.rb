class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.date :date
      t.string :place
      t.string :genre
      t.string :norma
      t.text :detail
      t.integer :user_id
      t.string :area
      t.timestamps
    end
  end
end
