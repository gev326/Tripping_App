class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :location
      t.string :date
      t.string :picture
      t.string :mode
      t.string :departure_location
      t.string :departure_time
      t.string :return_location
      t.string :return_time

      t.timestamps null: false
    end
  end
end
