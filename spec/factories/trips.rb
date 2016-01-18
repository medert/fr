FactoryGirl.define do
  factory :trip do
    sequence(:user_id) { |n| n }
    sequence(:origin) { |n| "origin no. #{n}" }
    sequence(:destination) { |n| "destination no. #{n}" }
    sequence(:meet_point) { |n| "place no. #{n}" }

    # factory :trip_with_riderhsip do
    #   after(:create) do |new_tip|
    #     FactoryGirl.create(:ridehship, trip: new_trip)
    #   end
    # end
  end
end
