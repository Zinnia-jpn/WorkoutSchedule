class RecordsController < ApplicationController
  before_action :logged_in_check
  before_action -> {
    get_select_record(params[:token])
  }, only: [:edit, :update, :destroy]

  def new
    @record = Record.new()
  end

  def create
    @record = Record.new(record_params)
    @record.user_id = @current_user.id
    if @record.save
      flash[:success] = t("records.create.success")
      redirect_to schedule_day_url(date: @record.date)
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @record.update(record_params)
      flash[:success] = t("records.update.success")
      redirect_to schedule_day_url(date: @record.date)
    else
      render "edit"
    end
  end

  def destroy
    @record.destroy
    flash[:success] = t("records.destroy.success")
    redirect_to request.referrer
  end

  # app/javascript/record.jsからAjaxで送信された値を元にフォームを生成
  def dynamic_select_category
    @token = params[:token]
    @workouts = Workout.where(category_id: params[:category_id]).reference_data
    params[:category_id].to_i == 1 ? cardio_flag = true : cardio_flag = false
    if params[:record].present?
      @record = Record.new(record_params)
      @record.cardio_flag = cardio_flag
    else
      @record = Record.new(date: Date.today, do_flag: false, cardio_flag: cardio_flag)
    end
  end

  private
  # tokenを元にrecordを検索・取得
  def get_select_record(token)
    @record = Record.find_by(token: token)
    check_created_user(@record)
    @token = token
    required_data(@record)
  end

  # editに必要なデータを渡す(update失敗時のrenderにも必要)
  def required_data(record)
    @category_id = reverse_lookup_category_id(record)
    @workouts = Workout.where(category_id: @category_id).reference_data
  end

  # 現在のユーザーとrecordを作成したユーザーが一致するか
  def check_created_user(record)
    created_user = User.find_by(id: record.user_id)
    redirect_to schedule_day_url unless current_user?(created_user)
  end

  def record_params
    params.require(:record).permit(
      :date, :do_flag, :workout_id, :cardio_flag,
      :weight, :rep, :set, :interval, :time, :intensity_id, :remark)
  end

  # recordからcatecoryを逆引き
  def reverse_lookup_category_id(record)
    workout = Workout.find_by(id: record.workout_id)
    workout.category_id
  end
end
