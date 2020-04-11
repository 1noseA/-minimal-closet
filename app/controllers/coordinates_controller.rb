class CoordinatesController < ApplicationController
  def index
  end

  def show
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
  end

  def update
  end

  def destroy
  end

  private
  def coordinate_params
    params.require(:coordinate).permit(:image,:text,:user_id)
  end
  
end
