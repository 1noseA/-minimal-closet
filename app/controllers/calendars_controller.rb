class CalendarsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user
  before_action :set_calendar, only: [:show, :edit, :update, :destroy]

  def index
    @calendars = current_user.calendars
  end

  def show
  end

  def new
    @user = current_user
    @calendar = Calendar.new
  end

  def create
    @calendar = Calendar.new(calendar_params)
    @calendar.user_id = current_user.id
    if @calendar.save
      redirect_to user_calendars_path(current_user), notice: "保存しました"
    else
      @user = current_user
      render :new
    end
  end

  def destroy
    @calendar.destroy
    redirect_to user_calendars_path(current_user), notice: "削除しました"
  end

  def edit
  end

  def update
    @calendar.user_id = current_user.id
    if @calendar.update(calendar_params)
      redirect_to user_calendars_path(current_user), notice: "編集しました"
    else
      render :edit
    end
  end

  private

  def calendar_params
    params.require(:calendar).permit(:user_id, :day_image, :text, :start_time)
  end

  def correct_user
    user = User.find(params[:user_id])
    if current_user != user
      redirect_to user_path(current_user)
    end
  end

  def set_calendar
    @calendar = Calendar.find(params[:id])
  end
end
