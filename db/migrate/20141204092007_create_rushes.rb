class CreateRushes < ActiveRecord::Migration
  def change
    create_table :rushes do |t|
      t.date :date_d
      t.date :date_f
      t.boolean :special

      t.timestamps
    end
  end
end
