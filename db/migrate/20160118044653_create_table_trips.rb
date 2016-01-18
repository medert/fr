class CreateTableTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.belongs_to :user
      t.string :origin, null: false
      t.string :destination, null: false
      t.string :meet_point, null: false
    end
  end
end
