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
    if @item.save
    @item.category_id = params[:item][:category][:category_id]
    @item.scene_id = params[:item][:scene][:scene_id]
    @item.season_id = params[:item][:season][:season_id]
    #redirect_to user_path(current_user)
    redirect_to items_path
    else
    @categories = Category.all
    @scenes = Scene.all
    @seasons = Season.all
    render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
    redirect_to user_path(current_user)
    else
    render :edit
    end
  end

  def destroy
  end

  private
  def item_params
    params.require(:item).permit(:item_image,:name,:text,:category_id,:scene_id,:season_id)
  end
  
end
