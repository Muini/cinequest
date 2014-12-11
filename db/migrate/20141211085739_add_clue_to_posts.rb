class AddClueToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :clue, :text
  end
end
