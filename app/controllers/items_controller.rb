class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    # ベスト３
    @best_ranks = Item.find(current_user.likes.group(:item_id).order('count(item_id) desc').limit(3).pluck(:item_id))

    # ワースト３
    # 着用回数０のアイテムを左外部結合で抽出
    @unlikes = Item.left_joins(:likes).where(likes: { id: nil }, user_id: current_user.id).limit(3)
    # @worst_ranksは着用回数１以上のアイテムを順位付け
    # 着用回数０が３以上の場合とそれ以外で分ける
    # @unlikesと@worst_ranks合わせて３アイテム表示になるように
    if @unlikes.count >= 3
      @worst_ranks = @unlikes
    else
      @worst_ranks = @unlikes.to_a + Item.find(current_user.likes.group(:item_id).order('count(item_id) asc').limit(3 - @unlikes.count).pluck(:item_id))
    end
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
    if @item.save
      redirect_to user_path(current_user), notice: "保存しました"
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
      redirect_to user_path(current_user), notice: "編集しました"
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
    redirect_to user_path(current_user), notice: "削除しました"
  end

  private

  def item_params
    params.require(:item).permit(:item_image, :name, :text, :category_id, :scene_id, :season_id, :user_id)
  end

  def correct_user
    item = Item.find(params[:id])
    if current_user != item.user
      redirect_to user_path(current_user)
    end
  end
end
