class AddDefaultValueToClosed < ActiveRecord::Migration
  def change
    change_column :posts, :closed, :boolean, :default => false
  end
end
