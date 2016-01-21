require 'rails_helper'

describe Review do
  it { belong_to :rider }
  it { belong_to :trip }

  it { should have_valid(:rating).when(1) }
  it { should_not have_valid(:rating).when("") }

  it { should have_valid(:review_body).when("The driver kept great company", "", nil) }
end
