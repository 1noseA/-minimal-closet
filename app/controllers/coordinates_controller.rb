class CoordinatesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @coordinates = @user.coordinates.page(params[:page]).per(50)
  end

  def show
    @user = User.find_by(params[:user_id])
    @coordinate = Coordinate.find(params[:id])
  end

  def new
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
  
end
