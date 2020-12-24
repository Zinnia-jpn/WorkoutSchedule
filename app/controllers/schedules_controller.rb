class SchedulesController < ApplicationController
# アソシエーション
  before_action :record_required_data_get, only: [:date, :dynamic_select_date, :month, :dynamic_select_month]

# アクション
  def date
    @select_value = "today"
    get_date_records(Date.today)
  end

  def dynamic_select_date # schedule/dateにて、前後3日間から選択すると発火
    @select_value = params[:value]
    case @select_value # @select_valueを元にselect_dateに日付を格納する
      when "yesterday" then select_date = Date.yesterday
      when "today" then select_date = Date.today
      when "tomorrow" then select_date = Date.tomorrow
    end
    get_date_records(select_date)
  end

  def month
    @select_year_month = Date.today
    get_month_records(@select_year_month)
  end

  def dynamic_select_month # schedule/monthにて、表示する月を選択すると発火
    @select_year_month = Date.new(params["year_month(1i)"].to_i, params["year_month(2i)"].to_i)
    get_month_records(@select_year_month)
  end

# アクションにて使用するメソッド
  def get_date_records(select_date) # 指定された日のRecordを取得
    @date_records = Record.new().get_specified_records(@user.id, select_date)
  end

  def get_month_records(select_month) # 指定された月のRecordを取得
    specified_month = select_month.in_time_zone.all_month # 指定された月の初日から末日まで
    @month_records = Record.new().get_specified_records(@user.id, specified_month)
  end
end
