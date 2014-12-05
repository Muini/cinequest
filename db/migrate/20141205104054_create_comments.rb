class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :message
      t.references :id_user, index: true
      t.references :id_post, index: true
      t.boolean :valid

      t.timestamps
    end
  end
end
