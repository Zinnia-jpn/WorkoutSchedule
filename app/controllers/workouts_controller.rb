class WorkoutsController < ApplicationController

  def new
    if params[:flag] != "true" && params[:flag] != "false"
      params[:flag] = "true"
    end
    convert_flag_to_boolean_type(params[:flag])
    @workout = Workout.new()
  end

  def create
    convert_flag_to_boolean_type(params[:plan_flag])
    @workout = Workout.new(
        user_id: session[:user_id],
        date: Date.today,
        whether_plan: @plan_flag,
        exercise_id: params[:exercise_category_id],
        weight: params[:weight],
        rep: params[:rep],
        set: params[:set],
        interval: params[:interval],
        time: params[:time],
        intensity: params[:intensity],
        remark: params[:remark]
    )
    if @workout.save
      flash[:success] = "記録が完了しました"
      redirect_to schedule_url
    else
      render "new"
    end
  end

  # app/javascript/workout.jsからAjaxで送信された値を元にフォームを生成
  def dynamic_select_muscle_part
    convert_flag_to_boolean_type(params[:flag])
    @muscle_part_id = params[:muscle_part_id].to_i
    @exercise_categories = ExerciseCategory.where(muscle_parts_id: params[:muscle_part_id])
  end

  # 引数をboolean型に変換
  def convert_flag_to_boolean_type(flag)
    @plan_flag = ActiveRecord::Type::Boolean.new.cast flag
  end
end
