class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :url_img
      t.string :url_film
      t.references :user_id, index: true
      t.boolean :found
      t.boolean :hardlevel

      t.timestamps
    end
  end
end
