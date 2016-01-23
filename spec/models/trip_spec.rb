require 'rails_helper'

describe Trip do

  it { should belong_to :driver }
  it { should have_many :reviews }

  it { should have_valid(:origin).when("Boston") }
  it { should_not have_valid(:origin).when("", nil) }

  it { should have_valid(:destination).when("Braintree") }
  it { should_not have_valid(:destination).when("", nil) }

  it { should have_valid(:meet_point).when("Quincy") }
  it { should_not have_valid(:meet_point).when("", nil) }

  it { should have_valid(:rate).when(10.00) }
  it { should_not have_valid(:rate).when("", nil) }

  it { should have_valid(:car_make).when("Subaru") }
  it { should_not have_valid(:car_make).when("", nil) }

  it { should have_valid(:car_model).when("Forester") }
  it { should_not have_valid(:car_model).when("", nil) }

  it { should have_valid(:car_plate).when("RTGW2") }
  it { should_not have_valid(:car_plate).when("", nil) }

  it { should have_valid(:avail_cap).when(2) }
  it { should_not have_valid(:avail_cap).when("", nil) }
end
