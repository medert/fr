FactoryGirl.define do
  factory :trip do
    driver
    sequence(:origin) { |n| "origin no. #{n}" }
    sequence(:destination) { |n| "destination no. #{n}" }
    sequence(:meet_point) { |n| "place no. #{n}" }
    rate 2
    sequence(:car_make) { |n| "make no. #{n}" }
    sequence(:car_model) { |n| "model no. #{n}" }
    sequence(:car_plate) { |n| "car_plate no. #{n}" }
    avail_cap 4
  end
end
