class RenameColumnInReviewAndTrips < ActiveRecord::Migration
  def change
    rename_column :trips, :user_id, :driver_id
    rename_column :reviews, :user_id, :rider_id
  end
end
