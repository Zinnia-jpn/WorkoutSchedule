module ApplicationHelper
  def javascript_path
    url = get_previous_path
    previous_controller = url[:controller]
    previous_action = url[:action]
    "#{previous_controller}/#{previous_action}_url_render.js"
  end

  private
  # 遷移元のURLを取得
  def get_previous_path
    Rails.application.routes.recognize_path(request.referrer)
  end
end
