class LikesController < ApplicationController
  def create
    item = Item.find(params[:item_id])
    like = current_user.likes.new(item_id: item.id)
    like.save
    redirect_to item_path(item)
  end
end
