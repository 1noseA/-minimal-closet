class ConstantsController < ApplicationController
  def new
    @user = current_user
    @constant = Constant.new
  end

  def create
    @constant = Constant.new(constant_params)
    @constant.user_id = current_user.id
    if @constant.save
      redirect_to items_path, notice: "保存しました"
    end
  end

  def edit
    @user = current_user
    @category = Category.find(params[:id])
  end

  def update
    @user = current_user
    @category = Category.find(params[:category_id])
    if constant.update(constant_params)
      redirect_to items_path, notice: "更新しました"
    end
  end

  private
  def constant_params
    params.require(:constant).permit(:constant,:user_id,:category_id)
  end
end
