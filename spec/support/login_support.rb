module LoginSupport
  def login_as(user)
    post login_path, params: { email: user.email,
                               password: user.password }
  end

  RSpec.shared_context "ログイン状態の時" do
    before do
      login_as(user)
    end
  end

  # 全てのspec内でこのファイルを読み込む
  RSpec.configure do |config|
    config.include LoginSupport
  end
end
