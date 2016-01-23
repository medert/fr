class CreateTableReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.belongs_to :user
      t.belongs_to :trip
      t.integer :rating, default: 0
      t.text :review_body
    end
  end
end
