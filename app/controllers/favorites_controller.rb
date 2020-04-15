class FavoritesController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @coordinate = Coordinate.find(params[:coordinate_id])
    favorite = current_user.favorites.build(coordinate_id: @coordinate.id)
    favorite.save
  end

  def destroy
    @user = User.find(params[:user_id])
    @coordinate = Coordinate.find(params[:coordinate_id])
    favorite = current_user.favorites.find_by(coordinate_id: @coordinate.id,user_id: current_user.id)
    favorite.destroy
  end
end
