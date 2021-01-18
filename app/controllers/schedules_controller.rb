class SchedulesController < ApplicationController
  include ApplicationHelper
  before_action :logged_in_check
  before_action :convert_to_date, only: [:day, :month]

  def day
    get_records(@select_date, false)
  end

  def month
    get_records(@select_date, true)
  end

  private
  # パラメータをDate型に変換
  def convert_to_date
    if params["date(1i)"].present? && params["date(2i)"].present? && params["date(3i)"].present? # モーダル経由
      date = Date.new(params["date(1i)"].to_i, params["date(2i)"].to_i, params["date(3i)"].to_i)
    end
    date = params[:date].to_date if params[:date].present? # records・schedules#dayのボタン経由
    date.present? ? @select_date = date :  @select_date = Date.today # パラメータなしなら当日
  end

  # 指定された日付のRecordを取得
  def get_records(select_date, is_month)
    select_date = select_date.in_time_zone.all_month if is_month # 月の場合は初日から末日までの範囲を取得
    @date_records = Record.get_specified_records(@current_user.id, select_date)
  end
end
