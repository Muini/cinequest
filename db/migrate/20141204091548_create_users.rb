class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :pseudo
      t.string :nom
      t.string :prenom
      t.string :email
      t.string :url_img
      t.string :mdp
      t.integer :credits
      t.integer :r_credits
      t.boolean :king

      t.timestamps
    end
  end
end
