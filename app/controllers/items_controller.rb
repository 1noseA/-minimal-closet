class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
    @categories = Category.all
    @scenes = Scene.all
    @seasons = Season.all
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    @item.category_id = params[:item][:category][:category_id]
    @item.scene_id = params[:item][:scene][:scene_id]
    @item.season_id = params[:item][:season][:season_id]
    if @item.save!
    redirect_to user_path(current_user)
    else
    @categories = Category.all
    @scenes = Scene.all
    @seasons = Season.all
    render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
    @categories = Category.all
    @scenes = Scene.all
    @seasons = Season.all
  end

  def update
    @item = Item.find(params[:id])
    @item.user_id = current_user.id
    @item.category_id = params[:item][:category][:category_id]
    @item.scene_id = params[:item][:scene][:scene_id]
    @item.season_id = params[:item][:season][:season_id]
    if @item.update(item_params)
    redirect_to user_path(current_user)
    else
    @categories = Category.all
    @scenes = Scene.all
    @seasons = Season.all
    render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to user_path(current_user)
  end

  private
  def item_params
    params.require(:item).permit(:item_image,:name,:text,:category_id,:scene_id,:season_id,:user_id)
  end
  
end
