class AddDefaultValueToSpecialRush < ActiveRecord::Migration
  def change
    change_column :rushes, :special, :boolean, :default => false, :null => false
  end
end
