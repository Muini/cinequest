class AddDefaultValueToKing < ActiveRecord::Migration
  def change
    change_column :users, :king, :boolean, :default => false, :null => false
  end
end
