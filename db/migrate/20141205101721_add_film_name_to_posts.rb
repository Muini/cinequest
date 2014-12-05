class AddFilmNameToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :film_name, :string
  end
end
