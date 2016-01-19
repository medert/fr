class CreateTableTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.belongs_to :user
      t.string :origin, null: false
      t.string :destination, null: false
      t.string :meet_point, null: false
      t.integer :rate, default: 0
      t.string :car_make
      t.string :car_model
      t.string :car_plate
      t.integer :avail_cap, default: 1

      t.timestamps null: false
    end
  end
end
