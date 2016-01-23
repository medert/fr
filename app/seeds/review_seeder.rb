class ReviewSeeder
  REVIEWS = [
    {
      rider_id: 1,
      trip_id: 1,
      rating: 2,
      review_body: "Liked it a lot",
      driver_id: 2
      }
  ]

  def self.seed!
    REVIEWS.each do |review_params|
      rider_id = review_params[:rider_id]
      review = Trip.find_or_initialize_by(rider_id: rider_id)
      review.assign_attributes(review_params)
      review.save
    end
  end
end
