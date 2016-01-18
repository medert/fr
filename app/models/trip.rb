class Trip < ActiveRecord::Base
  belongs_to :user

  validates :origin, presence: true
  validates :destination, presence: true
  validates :meet_point, presence: true
end
