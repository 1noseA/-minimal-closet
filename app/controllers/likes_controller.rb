class LikesController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    like = current_user.likes.build(item_id: params[:item_id])
    like.save
  end
end
