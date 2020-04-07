class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @items = Item.all
  end

  def edit
  end

  def update
  end

end
