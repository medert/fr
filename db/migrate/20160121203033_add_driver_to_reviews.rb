class AddDriverToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :driver_id, :integer, null: false
    add_timestamps(:reviews)
  end
end
