class AddDefaultValueToPost < ActiveRecord::Migration
  def change
    change_column :posts, :found, :boolean, :default => false, :null => false
    change_column :posts, :difficulty, :integer, :default => 0
    rename_column :posts, :user_id_id, :user_id
  end
end
