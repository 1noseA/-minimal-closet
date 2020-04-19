class CoordinatesController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:new, :create, :edit,:update]

  def index
    @user = User.find(params[:user_id])
    @coordinates = @user.coordinates.page(params[:page]).per(50)
  end

  def show
    @user = User.find(params[:user_id])
    @coordinate = Coordinate.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @coordinate = Coordinate.new
  end

  def create
    @coordinate = Coordinate.new(coordinate_params)
    @coordinate.user_id = current_user.id
    if @coordinate.save
      redirect_to user_coordinates_path(current_user)
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @coordinate = Coordinate.find(params[:id])
  end

  def update
    @coordinate = Coordinate.find(params[:id])
    @coordinate.user_id = current_user.id
    if @coordinate.update(coordinate_params)
      redirect_to user_coordinates_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    @coordinate = Coordinate.find(params[:id])
    @coordinate.destroy
    redirect_to user_coordinates_path(current_user)
  end

  private
  def coordinate_params
    params.require(:coordinate).permit(:image,:text,:user_id)
  end

  def correct_user
    user = User.find(params[:user_id])
    if current_user != user
      redirect_to user_path(current_user)
    end
  end
  
end
