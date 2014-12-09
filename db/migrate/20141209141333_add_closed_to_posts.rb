class AddClosedToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :closed, :boolean
    rename_column :comments, :closed, :correct
    change_column :posts, :hardlevel, :integer
    rename_column :posts, :hardlevel, :difficulty
  end
end
