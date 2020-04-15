class FavoritesController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @coordinate = Coordinate.find(params[:coordinate_id])
    @favorite = current_user.favorites.new(coordinate_id: @coordinate.id)
    @favorite.save
    redirect_back(fallback_location: root_path)
    #redirect_to user_coordinate_path(@user,@coordiate)
  end

  def destroy
    @user = User.find(params[:user_id])
    @coordinate = Coordinate.find(params[:coordinate_id])
    @favorite = current_user.favorites.find_by(coordinate_id: @coordinate.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
    #redirect_to user_coordinate_path(@user,@coordinate)
  end
end
