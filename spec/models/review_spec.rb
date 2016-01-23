require 'rails_helper'

describe Review do
  it { should belong_to :rider_reviews }
  it { should belong_to :trip }
  it { should belong_to :driver_reviews }

  it { should have_valid(:rating).when(1) }
  it { should_not have_valid(:rating).when("") }

  it { should have_valid(:review_body).when("The driver was great", "", nil) }
end
