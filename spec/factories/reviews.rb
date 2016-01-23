FactoryGirl.define do
  factory :review do
    rider
    trip
    driver
    rating 2
    sequence(:review_body) { |n| "Review no. #{n}" }
  end
end
