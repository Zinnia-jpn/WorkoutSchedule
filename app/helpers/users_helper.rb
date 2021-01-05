module UsersHelper
  # 指定のユーザーが登録した画像のurlを返す(なければデフォルトの画像)
  def image(user)
    user.image? ? user.image.url : "/images/default_user_image.jpeg"
  end
end
