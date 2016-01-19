FactoryGirl.define do
  factory :user do
    sequence(:first_name) { |n| "John#{n}" }
    sequence(:last_name) { |n| "Doe#{n}" }
    birthdate {[20.years.ago, 40.years.ago].sample}
    gender { ["male", "female"].sample }
    sequence(:address) { |n| "#{n} Baxter street" }
    town { ["Chicago", "Portland"].sample }
    state { ["WA", "RI"].sample }
    sequence(:zip) { |n| "#{n}2#{n}3#{n}" }
    sequence(:d_lisence) { |n| "TRB#{n}C#{n}" }
    sequence(:phone) { |n| "11#{n}-111-111#{n}" }
    role "member"
    sequence(:email) { |n| "johnsmith#{n}@gmail.com" }
    password "password"
    password_confirmation "password"
  end
  

end
