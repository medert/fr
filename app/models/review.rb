class Review < ActiveRecord::Base
  belongs_to :trip
  belongs_to :rider_reviews, class_name: "User", foreign_key: "rider_id"
  belongs_to :driver_reviews, class_name: "User", foreign_key: "driver_id"

  validates :rating, numericality: true
  validates :rating, numericality: { greater_than_or_eaqual_to: 0, less_than_or_equal_to: 5 }
end
