class RecordsController < ApplicationController

  def new
    if params[:flag] != "true" && params[:flag] != "false"
      params[:flag] = "true"
    end
    convert_flag_to_boolean_type(params[:flag])
    @record = Record.new()
  end

  def create
    convert_flag_to_boolean_type(params[:plan_flag])
    @record = Record.new(
        user_id: session[:user_id],
        date: params[:date],
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
end
