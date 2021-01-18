require 'rails_helper'

RSpec.describe "Records", type: :request do
  let(:user) { build(:user) }
  let!(:record) { create(:record, token: "7EcAdn8kIqZkgYC8gyBHmw") }
  let(:record_3) { build(:record_3) }


  before do
    # assosiationを設定しているため、userも一緒に生成される
    # create(:record, token: "7EcAdn8kIqZkgYC8gyBHmw")
  end

  describe "GET #new" do
    it_behaves_like "ログイン状態の時" do
      example "リクエストが成功する" do
        get new_record_path
        expect(assigns(:record)).to be_truthy
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "POST #create" do
    it_behaves_like "ログイン状態の時" do
      example "リクエストが成功する" do
        post records_path, params: { record: { date: record_3.date,
                                              do_flag: record_3.do_flag,
                                              workout_id: record_3.workout_id,
                                              cardio_flag: record_3.cardio_flag,
                                              weight: record_3.weight,
                                              rep: record_3.rep,
                                              set: record_3.set,
                                              interval: record_3.interval,
                                              time: record_3.time,
                                              intensity_id: record_3.intensity_id,
                                              remark: record_3.remark } }
        expect(Record.find_by(id: 2)).to be_truthy
        expect(response).to have_http_status(302)
        # expect(response).to redirect_to(schedule_day_url, params: record: { year: record_3.date.year,
        #                                                                     month: record_3.date.month,
        #                                                                     day: record_3.date.day } )
      end
    end
  end

  xdescribe "GET #edit" do
    it_behaves_like "ログイン状態の時" do
      example "リクエストが成功する" do
        Workout.all
        get edit_record_path(token: record.token)
        expect(response).to have_http_status(:success)
      end
    end
  end

  xdescribe "PATCH #update" do
    context "正常なHTTPリクエストを送った時" do
      example "リクエストが成功する" do
        patch record_path
        expect(response).to have_http_status(:success)
      end
    end
  end

  xdescribe "DELETE #destroy" do
    it_behaves_like "ログイン状態の時" do
      example "recordの削除に成功する" do
        get schedule_month_path
        delete record_path(token: record.token)
        expect(response).to redirect_to(schedule_month_url)
      end
    end
  end
end
