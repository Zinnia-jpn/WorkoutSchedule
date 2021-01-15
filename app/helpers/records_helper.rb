module RecordsHelper
  # formの送信先となるurlを取得
  def record_form_url(token = nil)
    current_or_previous_action_is_edit? && token != nil ? record_path(token) : records_path
  end

  # urlを元にmethodを指定
  def record_form_method
    current_or_previous_action_is_edit? ? "patch" : "post"
  end

  private
  # 現在か前のactionがeditかどうか
  def current_or_previous_action_is_edit?
    previous_path[:action] == "edit" || action_name == "edit"
  end
end
