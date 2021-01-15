class SchedulesController < ApplicationController
  include ApplicationHelper
  before_action :logged_in_check
  before_action :assignment_year_month, only: [:day, :month]

  def day
    @select_date = @select_date.change(day: params[:date][:day].to_i) if params[:date].present?
    get_records(@select_date, false)
  end

  def month
    get_records(@select_date, true)
  end

  # パラメータを整形してday・monthアクションに返す
  def receive_selection
    if previous_path[:action] == "month"
      redirect_to schedule_month_url(date: {year: params["date(1i)"], month: params["date(2i)"], day: 1})
    elsif previous_path[:action] == "day"
      redirect_to schedule_day_url(date: {year: params["date(1i)"], month: params["date(2i)"], day: params["date(3i)"]})
    else
      redirect_to schedule_day_url
    end
  end

  private
  # 年月のみ代入(日はdayアクション内で書き換え)
  def assignment_year_month
    if params[:date].present?
      @select_date = Date.new(params[:date][:year].to_i, params[:date][:month].to_i, params[:date][:day].to_i)
    else
      @select_date = Date.today
    end
  end

  # 指定された日付のRecordを取得
  def get_records(select_date, is_month)
    select_date = select_date.in_time_zone.all_month if is_month # 月の場合は初日から末日までの範囲を取得
    @date_records = Record.new().get_specified_records(@current_user.id, select_date)
  end
end
