# require_relative "api/mbta.rb"

class TripsController < ApplicationController
  before_action :authorize_user, only: [:destroy]
  # before_action :trip, only: [:show, :edit, :update, :destroy]
  # before_action :review, only: [:show, :edit, :update, :destroy]

  def index
    @trips = Trip.all
    # @mbta = Mbta.new("Red Line")
  end

  def show
    @review = Review.new
    trip_reviews = Review.where(trip_id: trip)
    @reviews = trip_reviews.order(created_at: :desc).page params[:page]
    @rating = @trip.reviews.average(:rating)
    if @rating.nil?
      @rating = "N/A"
    else
      @rating = @rating.round(1)
    end
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.driver_id = current_user.id
    if @trip.save
      flash[:notice] = "Trip successfully created!"
      redirect_to root_path
    else
      flash[:alert] = @trip.errors.full_messages
      render 'new'
    end
  end

  def edit
    trip
  end

  def update
    if trip.update(trip_params)
      flash[:notice] = "You have successfully updated your question!"
      redirect_to trip_path
    else
      flash.now[:notice] = "Invalid input."
      render 'edit'
    end
  end

  def destroy
    if trip.destroy
      flash[:notice] = "You have deleted trip successfully!"
      redirect_to root_path
    else
      flash[:notice] = "You failed to delete trip!"
      render :show
    end
  end

  private

  def trip
    @trip ||= Trip.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(
      :driver_id,
      :origin,
      :destination,
      :meet_point,
      :rate,
      :car_model,
      :car_make,
      :car_plate,
      :avail_cap
    )
  end
end
