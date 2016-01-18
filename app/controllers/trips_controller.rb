class TripsController < ApplicationController
  before_action :authorize_user, only: [:destroy]
  before_action :trip, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search] == ""
      trips = Trip.none
    elsif params[:search]
      trips = Trip.where("title ILIKE ?", "%#{params[:search]}%")
    else
      trips = Trip.all
    end
    @trips = Trip.all
  end

  def show

  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user_id = current_user.id

    if @trip.save
      flash[:success] = "Trip successfully created!"
      redirect_to root_path
    else
      flash[:notice] = @trip.errors.full_messages
      render 'new'
    end
  end

  def edit
  end

  def update
    if @trip.update(trip_params)
      flash[:notice] = "You have successfully updated your question!"
      redirect_to @trip
    else
      flash.now[:notice] = "Invalid input."
      render 'edit'
    end
  end

  def destroy
    if @trip.destroy
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
      :user_id,
      :origin,
      :destination,
      :meet_point
    )
  end
end
