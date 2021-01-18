require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:user) { create(:user) }
  let(:user_2) { build(:user_2) }

  describe "GET #new" do
    context "非ログイン状態の時" do
      example "リクエストが成功する" do
        get signup_path
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "POST #create" do
    context "非ログイン状態の時" do
      example "リクエストが成功する" do
        post user_create_path, params: { user: { name: user_2.name,
                                                 email: user_2.email,
                                                 password: user_2.password,
                                                 password_confirmation: user_2.password } }
        expect(session[:user_id]).to be_truthy
        expect(flash[:success]).to eq( I18n.t("users.create.success") )
        expect(response).to redirect_to(schedule_day_url)
      end
    end
  end

  describe "GET #show" do
    it_behaves_like "ログイン状態の時" do
      example "リクエストが成功する" do
        get user_path
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "GET #edit" do
    it_behaves_like "ログイン状態の時" do
      example "ユーザーの情報を取得しリクエストが成功する" do
        get user_edit_path
        expect(assigns(:user)).to eq(user)
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "PATCH #update" do
    it_behaves_like "ログイン状態の時" do
      example "リクエストが成功する" do
        patch user_update_path, params: { user: { name: user_2.name,
                                                  email: user_2.email,
                                                  current_password: user.password,
                                                  password: user_2.password,
                                                  password_confirmation: user_2.password } }
        expect(user.reload.name).to eq(user_2.name)
        expect(user.reload.email).to eq(user_2.email)
        expect(user.reload.authenticate(user_2.password)).to be_truthy
        expect(response).to redirect_to(user_url)
      end
    end
  end

  describe "DELETE #destroy" do
    it_behaves_like "ログイン状態の時" do
      example "userが削除される" do
        delete user_delete_path
        expect(User.find_by(email: user.email)).to be_falsey
        expect(session[:account_deleted]).to eq(true)
        expect(response).to redirect_to(account_deleted_url)
      end
    end
  end

  xdescribe "#revert_image" do
    it_behaves_like "ログイン状態の時" do
      example "画像が削除される" do
        post user_revert_image_path
        expect(user.reload.image).to be_falsely
        expect(flash[:success]).to eq( I18n.t("users.revert_image.success") )
        expect(response).to redirect_to(user_url)
      end
    end
  end
end
