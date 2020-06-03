class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = User.all.page(params[:page]).per(10)
    @user = current_user
    @count = User.all
  end

  def show
    # distinctで重複するレコードを削除
    @items = @user.items.select(:category_id).distinct.order(:category_id)
    @categories = Category.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "編集しました"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def correct_user
    user = User.find(params[:id])
    if current_user != user
      redirect_to user_path(current_user)
    end
  end

  def set_user
    @user = User.find(params[:id])
  end
end
