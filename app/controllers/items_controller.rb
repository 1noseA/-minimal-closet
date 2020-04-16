class ItemsController < ApplicationController
  def index
    @all_ranks = Item.find(Like.group(:item_id).order('count(item_id) desc').limit(3).pluck(:item_id))
    @my_ranks = @all_ranks.select{ |item| item.user_id == current_user.id }
    @worst_ranks = Item.find(Like.group(:item_id).order('count(item_id) asc').limit(3).pluck(:item_id))
    @my_worst_ranks = @worst_ranks.select{ |item| item.user_id == current_user.id }
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
