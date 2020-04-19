class CalendarsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @calendars = @user.calendars
  end

  def new
    @user = User.find(params[:user_id])
    @calendar = Calendar.new
  end

  def show
    @user = User.find(params[:user_id])
    @calendar = Calendar.find(params[:id])
  end

  def create
    @calendar = Calendar.new(calendar_params)
    @calendar.user_id = current_user.id
    if @calendar.save!
      redirect_to user_calendars_path(current_user)
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @calendar = Calendar.find(params[:id])
    @calendar.destroy
    redirect_to user_calendars_path(@user), notice:"削除しました"
  end

  def edit
    @user = User.find(params[:user_id])
    @calendar = Calendar.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @calendar = Calendar.find(params[:id])
    if @calendar.update(calendar_params)
      redirect_to user_calendars_path(@user), notice: "編集しました"
    else
      render :edit
    end
  end

  private
  def calendar_params
    params.require(:calendar).permit(:user_id, :day_image, :text, :start_time)
  end
end
