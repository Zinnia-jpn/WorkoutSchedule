module ApplicationHelper
  # Headerタイトルのリンク先を返す
  def header_title_path
    logged_in? ? schedule_day_path : root_path
  end

  # 遷移元のURLに書き換えるjsのpathを返す
  def javascript_path
    "#{previous_path[:controller]}/#{previous_path[:action]}_url_render.js"
  end

  # 遷移元のURLを取得
  def previous_path
    Rails.application.routes.recognize_path(request.referrer)
  end
end
