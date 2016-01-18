class TripsController < ApplicationController
  before_action :authorize_user, only: [:destroy]

  def index
    @trips = Trip.all
  end


end
