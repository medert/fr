FactoryGirl.define do
  factory :trip do
    sequence(:user_id) { |n| n }
    sequence(:origin) { |n| "origin no. #{n}" }
    sequence(:destination) { |n| "destination no. #{n}" }
    sequence(:meet_point) { |n| "place no. #{n}" }
    sequence(:rate) { |n| n }
    sequence(:car_make) { |n| "make no. #{n}" }
    sequence(:car_model) { |n| "model no. #{n}" }
    sequence(:car_plate) { |n| "car_plate no. #{n}" }
    sequence(:avail_cap) { |n| n }

    # factory :trip_with_riderhsip do
    #   after(:create) do |new_tip|
    #     FactoryGirl.create(:ridehship, trip: new_trip)
    #   end
    # end
  end
end
