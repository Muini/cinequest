class RenameCommentsCollumn < ActiveRecord::Migration
  def change
    rename_column :comments, :id_user_id, :user_id
    rename_column :comments, :id_post_id, :post_id
  end
end
