class RenameUsersPasswordTables < ActiveRecord::Migration
  def self.up
    rename_column :users, :mdp, :password
  end
end
