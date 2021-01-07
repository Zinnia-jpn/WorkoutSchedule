class RecordsController < ApplicationController
  before_action :login_check

  def new
    @record = Record.new()
  end

  def create
    date = divided_value_that_date_type_conversion(params["date(1i)"].to_i, params["date(2i)"].to_i, params["date(3i)"].to_i)
    do_flag = convert_flag_to_boolean_type(params[:do_flag])
    cardio_flag = convert_flag_to_boolean_type(params[:cardio_flag])
    @record = Record.new(
        user_id: @current_user.id,
        date: date,
        do_flag: do_flag,
        workout_id: params[:workout_id],
        cardio_flag: cardio_flag,
        weight: params[:weight],
        rep: params[:rep],
        set: params[:set],
        interval: params[:interval],
        time: params[:time],
        intensity_id: params[:intensity_id],
        remark: params[:remark]
    )
    if @record.save
      flash[:success] = t("records.create.success")
      redirect_to record_new_url
    else
      render "new"
    end
  end

  def edit
    @record = Record.find_by(id: params[:id])
    check_created_user(@record)
    record_required_data_get
    @cardio_flag = @record.cardio_flag.to_s
    # workout_idからcatecory_idを逆引き
    @current_workout = Workout.find_by(id: @record.workout_id)
    @category_id = @current_workout.category_id
    @workouts = Workout.where(category_id: @current_workout.category_id) # workoutセレクトボックスの選択肢
    @record_date = @record.date
  end

  def update
    @record = Record.find_by(id: params[:id])
    check_created_user(@record)
    date = divided_value_that_date_type_conversion(params["date(1i)"].to_i, params["date(2i)"].to_i, params["date(3i)"].to_i)
    do_flag = convert_flag_to_boolean_type(params[:do_flag])
    cardio_flag = convert_flag_to_boolean_type(params[:cardio_flag])
    if @record.update(date: date, do_flag: do_flag, workout_id: params[:workout_id], cardio_flag: cardio_flag,
                      weight: params[:weight], rep: params[:rep], set: params[:set], interval: params[:interval],
                      time: params[:time], intensity_id: params[:intensity_id], remark: params[:remark])
      flash[:success] = t("records.update.success")
      redirect_to schedule_month_url
    else
      render "edit"
    end
  end

  def destroy
    @record = Record.find_by(id: params[:id])
    @record.destroy
    flash[:success] = t("records.destroy.success")
    redirect_to schedule_month_url
  end

  def dynamic_select_category # app/javascript/record.jsからAjaxで送信された値を元にフォームを生成
    @intensities = Intensity.all
    @url = params[:url]
    @workouts = Workout.where(category_id: params[:category_id])
    # @recordに必要なデータを生成
    params[:category_id].to_i == 1 ? cardio_flag = true : cardio_flag = false
    if params[:do_flag].present?
      date = divided_value_that_date_type_conversion(params[:year].to_i, params[:month].to_i, params[:day].to_i)
      do_flag = convert_flag_to_boolean_type(params[:do_flag])
      @record = Record.new(id: params[:id], date: date, do_flag: do_flag, workout_id: params[:workout_id],
                           cardio_flag: cardio_flag, weight: params[:weight], rep: params[:rep], set: params[:set],
                           interval: params[:interval], time: params[:time], intensity_id: params[:intensity_id],
                           remark: params[:remark])
    else
      @record = Record.new(date: Date.today, do_flag: false, cardio_flag: cardio_flag)
    end
  end

  def convert_flag_to_boolean_type(flag) # 引数をboolean型に変換
    return ActiveRecord::Type::Boolean.new.cast flag
  end

  def divided_value_that_date_type_conversion(year, month, day) # 分割された値をdate型に束ねる
    return Date.new(year, month, day)
  end

  def check_created_user(record) # 現在のユーザーとrecordを作成したユーザーが一致するかチェック
    created_user = User.find_by(id: record.user_id)
    redirect_to schedule_date_url unless current_user?(created_user)
  end
end
