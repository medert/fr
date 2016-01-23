class ReviewsController < ApplicationController
  before_action :authorize_user, only: [:destroy]
  # before_action :trip, only: [:edit, :update, :destroy]

  def create
    @trip = Trip.find(params[:trip_id])
    @review = @trip.reviews.new(review_params)
    @review.rider_id = current_user.id
    @review.driver_id = @trip.driver.id
    if @review.save
      flash[:notice] = "Review posted successfully!"
      redirect_to trip_path(@trip)
    else
      flash[:notice] = @review.errors.full_messages
      render 'trips/show'
    end
  end
  
  def update
    if @review.update(review_params)
      flash[:notice] = "You have successfully updated your review!"
      redirect_to @trip
     else
      flash.now[:notice] = "Invalid input."
      render 'reviews/edit'
    end
  end

  def destroy
    if @review.destroy
      flash[:notice] = "You have deleted review successfully!"
      redirect_to trip_path(@trip)
    else
      flash[:notice] = "You failed to delete review!"
      render "trips/show"
    end
  end

  private

  def review_params
    params.require(:review).permit(
      :rider_id,
      :trip_id,
      :driver_id,
      :rating,
      :review_body
    )
  end
end
