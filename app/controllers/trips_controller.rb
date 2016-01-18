class TripsController < ApplicationController
  before_action :authorize_user, only: [:destroy]

  def index
    @users = User.all
  end

end
