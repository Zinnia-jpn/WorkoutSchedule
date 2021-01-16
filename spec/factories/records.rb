FactoryBot.define do
  # 無酸素運動
  factory :record, class: Record do
    association :user
    user_id { 1 }
    date { "2020-11-09" }
    do_flag { true }
    workout_id { 50 }
    cardio_flag { false }
    weight { 30 }
    rep { 10 }
    set { 3 }
    interval { 45 }
    time { nil }
    intensity_id { nil }
    remark { "少し負荷が軽かった" }
  end

  # 有酸素運動
  factory :record_2, class: Record do
    association :user
    user_id { 1 }
    date { "2020-11-09" }
    do_flag { true }
    workout_id { 1 }
    cardio_flag { true }
    weight { nil }
    rep { nil }
    set { nil }
    interval { nil }
    time { 15 }
    intensity_id { 3 }
    remark { "次は時間を長めに取る" }
  end
end
