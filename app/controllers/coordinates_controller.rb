class CoordinatesController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_coordinate, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only:[:index, :show, :new, :edit]

  def index
    @coordinates = @user.coordinates.page(params[:page]).per(50)
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
      redirect_to user_coordinates_path(current_user), notice: "保存しました"
    else
      @user = User.find(params[:user_id])
      render :new
    end
  end

  def edit
  end

  def update
    @coordinate.user_id = current_user.id
    if @coordinate.update(coordinate_params)
      redirect_to user_coordinates_path(current_user), notice: "編集しました"
    else
      render :edit
    end
  end

  def destroy
    @coordinate.destroy
    redirect_to user_coordinates_path(current_user), notice: "削除しました"
  end

  private

  def coordinate_params
    params.require(:coordinate).permit(:image, :text, :user_id)
  end

  def correct_user
    user = User.find(params[:user_id])
    if current_user != user
      redirect_to user_path(current_user)
    end
  end

  def set_coordinate
    @coordinate = Coordinate.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
