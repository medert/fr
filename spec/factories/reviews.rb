FactoryGirl.define do
  factory :review do
    driver
    rider
    rating 2
    sequence(:review_body) { |n| "Review no. #{n}"}
  end
end
