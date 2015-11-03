class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :date
      t.string :event
      t.string :time
      t.string :location
      t.string :information

      t.timestamps null: false
    end
  end
end
