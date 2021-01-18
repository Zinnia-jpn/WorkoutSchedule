require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  let(:user) { create(:user) }

  describe "GET #login_form" do
    context "非ログイン状態の時" do
      example "リクエストが成功する" do
        get login_path
        expect(response).to have_http_status(:success)
      end
    end

    it_behaves_like "ログイン状態の時" do
      example "非ログインチェックに引っかかる" do
        get login_path
        expect(flash[:warning]).to eq( I18n.t("sessions.login.already") )
        expect(response).to redirect_to(schedule_day_url)
      end
    end
  end

  describe "POST #login" do
    context "非ログイン状態の時" do
      # ログイン処理をする
      example "ログインに成功する" do
        post login_path, params: { email: user.email,
                                   password: user.password }
        expect(flash[:success]).to eq( I18n.t("sessions.login.success") )
        expect(response).to redirect_to(schedule_day_url)
      end
    end

    it_behaves_like "ログイン状態の時" do
      example "非ログインチェックに引っかかる" do
        post login_path, params: { email: user.email,
                                   password: user.password }
        expect(flash[:warning]).to eq( I18n.t("sessions.login.already") )
        expect(response).to redirect_to(schedule_day_url)
      end
    end
  end

  describe "POST #logout" do
    it_behaves_like "ログイン状態の時" do
      example "ログアウトに成功する" do
        post logout_path
        expect(flash[:success]).to eq( I18n.t("sessions.logout.success") )
        expect(session[:user_id]).to be_falsey
        expect(response).to redirect_to(root_url)
      end
    end

    context "非ログイン状態の時" do
      example "ログインチェックに引っかかる" do
        post logout_path
        expect(flash[:warning]).to eq( I18n.t("sessions.login.required") )
        expect(response).to redirect_to(login_url)
      end
    end
  end
end
