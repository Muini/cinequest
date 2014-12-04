class AddDefaultValueToUrlProfilImage < ActiveRecord::Migration
  def change
    change_column :users, :url_img, :string, :default => "http://corentinflach.fr/img/profil_default.jpg"
  end
end
