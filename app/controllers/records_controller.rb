class RecordsController < ApplicationController

  def new
    if params[:flag] != "true" && params[:flag] != "false"
      params[:flag] = "true"
    end
    convert_flag_to_boolean_type(params[:flag])
    @record = Record.new()
  end

  def create
    date = divided_value_that_date_type_conversion(params["date(1i)"].to_i, params["date(2i)"].to_i, params["date(3i)"].to_i)
    convert_flag_to_boolean_type(params[:plan_flag])
    @record = Record.new(
        user_id: session[:user_id],
        date: date,
        plan_flag: @plan_flag,
        workout_id: params[:workout_id],
        cardio_flag: params[:cardio_flag],
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
      redirect_to schedule_url
    else
      render "new"
    end
  end

  # app/javascript/record.jsからAjaxで送信された値を元にフォームを生成
  def dynamic_select_category
    convert_flag_to_boolean_type(params[:flag])
    @category_id = params[:category_id].to_i
    @workouts = Workout.where(category_id: params[:category_id])
    if @category_id == 1
      @cardio_flag = true
    else
      @cardio_flag = false
    end
    @intensities = Intensity.all
  end

  # 引数をboolean型に変換
  def convert_flag_to_boolean_type(flag)
    @plan_flag = ActiveRecord::Type::Boolean.new.cast flag
  end

  # 分割された値をdate型に変換
  def divided_value_that_date_type_conversion(year, month, day)
    return Date.new(year, month, day)
  end
end
