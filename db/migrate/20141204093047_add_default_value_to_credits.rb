class AddDefaultValueToCredits < ActiveRecord::Migration
  def change
    change_column :users, :credits, :integer, :default => 0
    change_column :users, :r_credits, :integer, :default => 0
  end
end
