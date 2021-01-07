module RecordsHelper
  # post先のURLを取得
  def post_url
    url = get_previous_path
    previous_action = url[:action]
    previous_action == "edit" || action_name == "edit" ? record_update_path : record_create_path
  end
end
