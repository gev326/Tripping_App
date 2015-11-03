class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :profile_pic, default: "default_img.jpg"
      t.integer :balance, default: 0
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
