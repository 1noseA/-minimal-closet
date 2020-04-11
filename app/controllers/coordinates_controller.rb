class CoordinatesController < ApplicationController
  def index
    @coordinates = Coordinate.all
    @user = current_user
  end

  def show
    @coordinate = Coordinate.find(params[:id])
  end

  def new
    @coordinate = Coordinate.new
  end

  def create
    @coordinate = Coordinate.new(coordinate_params)
    @coordinate.user_id = current_user.id
    if @coordinate.save
      redirect_to coordinates_path
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
      redirect_to coordinates_path
    else
      render :edit
    end
  end

  def destroy
    @coordinate = Coordinate.find(params[:id])
    @coordinate.destroy
    redirect_to coordinates_path
  end

  private
  def coordinate_params
    params.require(:coordinate).permit(:image,:text,:user_id)
  end
  
end
