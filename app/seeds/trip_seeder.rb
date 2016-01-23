class TripSeeder
  TRIPS = [
    {
      driver_id: 2,
      origin: "Boston",
      destination: "Braintree",
      meet_point: "Quincy",
      rate: 7,
      car_make: "Subaru",
      car_model: "Forester",
      car_plate: "TR456TR",
      avail_cap: 2
    }, {
      driver_id: 3,
      origin: "Alston",
      destination: "Newton",
      meet_point: "Quincy",
      rate: 2,
      car_make: "Toyota",
      car_model: "Forester",
      car_plate: "TR456TR",
      avail_cap: 4
    }
  ]

  def self.seed!
    TRIPS.each do |trip_params|
      driver_id = trip_params[:driver_id]
      trip = Trip.find_or_initialize_by(driver_id: driver_id)
      trip.assign_attributes(trip_params)
      trip.save
    end
  end
end
