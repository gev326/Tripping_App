class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.integer :balance
      t.references :trip, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
