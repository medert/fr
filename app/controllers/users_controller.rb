class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.where.not("id = ?",current_user.id).order("created_at DESC")
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @review = Review.new
    user_reviews = Review.where(driver_id: @user)
    @reviews = user_reviews.order(created_at: :desc).page params[:page]
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
end
