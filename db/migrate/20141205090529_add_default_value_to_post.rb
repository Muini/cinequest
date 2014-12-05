class AddDefaultValueToPost < ActiveRecord::Migration
  def change
    change_column :posts, :found, :boolean, :default => false, :null => false
    change_column :posts, :hardlevel, :boolean, :default => false, :null => false
    rename_column :posts, :user_id_id, :user_id
  end
end
