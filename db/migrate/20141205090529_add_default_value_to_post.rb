class AddDefaultValueToPost < ActiveRecord::Migration
  def change
    change_column :posts, :found, :boolean, :default => false, :null => false
    change_column :posts, :hardlevel, :integer
    change_column :posts, :hardlevel, 'integer USING CAST("hardlevel" AS integer)'
    change_column :posts, :hardlevel, :integer, :default => 0  
    rename_column :posts, :user_id_id, :user_id
  end
end
