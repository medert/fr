class Trip < ActiveRecord::Base
  belongs_to :user

  validates :origin, presence: true
  validates :destination, presence: true
  validates :meet_point, presence: true
  validates :rate, presence: true
  validates :car_make, presence: true
  validates :car_model, presence: true
  validates :car_plate, presence: true
  validates :car_plate, presence: true
  validates :avail_cap, presence: true
end
