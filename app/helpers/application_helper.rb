module ApplicationHelper
  # Headerタイトルのリンク先を返す
  def header_title_path
    logged_in? ? schedule_date_path : root_path
  end

  # 遷移元のURLに書き換えるjsのpathを返す
  def javascript_path
    url = get_previous_url
    previous_controller = url[:controller]
    previous_action = url[:action]
    "#{previous_controller}/#{previous_action}_url_render.js"
  end

  private
  # 遷移元のURLを取得
  def get_previous_url
    Rails.application.routes.recognize_path(request.referrer)
  end
end
