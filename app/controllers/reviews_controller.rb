class ReviewsController < ApplicationController
  before_action :authorize_user, only: [:destroy]
  before_action :trip, only: [:show, :edit, :update, :destroy]
  before_action :trip, only: [:index, :show, :new :edit, :update, :destroy]

  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @review = @trip.review.new(review_params)
    @review.user = current_user

    if @review.save
      flash[:success] = "Review successfully created!"
      redirect_to trip_path(@trip.driver_id)
    else
      flash[:notice] = @review.errors.full_messages
      render 'new'
    end
  end

  private

  def review_params
    params.require(:review).permit(
      :trip_id,
      :rider_id,
      :rating,
      :review_body
    )
  end
end
