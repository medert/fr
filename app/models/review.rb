class Review < ActiveRecord::Base
  belongs_to :trip
  belongs_to :rider,
    class_name: "User"

  validates :rating, numericality: true
  validates :rating, numericality: { greater_than_or_eaqual_to: 0, less_than_or_equal_to: 5 }
end
