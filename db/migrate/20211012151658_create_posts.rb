class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :genre_id
      t.integer :user_id
      t.integer :country_id
      t.integer :image_id
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
