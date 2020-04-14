class UsersController < ApplicationController
  def index
    @users = User.all.page(params[:page]).per(10)
    @user = current_user
    @count = User.all
  end

  def show
    @user = User.find(params[:id])
    @items = @user.items.select(:category_id).distinct
    #binding.pry
    #.order(:category_id)
    @categories = Category.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private 
    def user_params
      params.require(:user).permit(:name, :profile_image, :introduction)
    end
end
