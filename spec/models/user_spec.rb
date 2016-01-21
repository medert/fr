require 'rails_helper'

describe User do
  it { should have_many :trips }
  it { should have_many :reviews }
  it { should have_many :riders }
  it { should have_many :reviews_on_self }

  it { should have_valid(:first_name).when("Meder") }
  it { should_not have_valid(:first_name).when("", nil) }

  it { should have_valid(:last_name).when("Meder") }
  it { should_not have_valid(:last_name).when("", nil) }

  it { should have_valid(:birthdate).when(21/11/1983) }
  it { should_not have_valid(:birthdate).when("", nil) }

  it { should have_valid(:gender).when("Male") }
  it { should_not have_valid(:gender).when("", nil) }

  it { should have_valid(:address).when("38 Baxter str.") }
  it { should_not have_valid(:address).when("", nil) }

  it { should have_valid(:town).when("Quincy") }
  it { should_not have_valid(:town).when("", nil) }

  it { should have_valid(:state).when("MA") }
  it { should_not have_valid(:state).when("", nil) }

  it { should have_valid(:zip).when("02169") }
  it { should_not have_valid(:zip).when("", nil) }

  it { should have_valid(:d_lisence).when("XYTS2345") }
  it { should_not have_valid(:d_lisence).when("", nil) }

  it { should have_valid(:phone).when("123456789") }
  it { should_not have_valid(:phone).when("", nil) }

  it { should have_valid(:phone).when("mt@gmail.com") }
  it { should_not have_valid(:phone).when("", nil) }
end
