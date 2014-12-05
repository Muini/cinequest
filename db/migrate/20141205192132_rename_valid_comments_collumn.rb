class RenameValidCommentsCollumn < ActiveRecord::Migration
  def change
    rename_column :comments, :valid, :closed
  end
end
