FactoryBot.define do
  # 無酸素運動
  factory :workout, class: Workout do
    association :user
    user_id { 1 }
    date { "2020-11-09" }
    whether_plan { true }
    exercise_id { 2 }
    muscle_parts_id { nil }
    weight { 30 }
    rep { 10 }
    set { 3 }
    interval { 45 }
    time { nil }
    intensity { nil }
    remark { "少し負荷が軽かった" }
  end

  # 有酸素運動
  factory :workout_2, class: Workout do
    association :user
    user_id { 1 }
    date { "2020-11-09" }
    whether_plan { true }
    exercise_id { 3 }
    muscle_parts_id { nil }
    weight { nil }
    rep { nil }
    set { nil }
    interval { nil }
    time { 15 }
    intensity { 3 }
    remark { "次は時間を長めに取る" }
  end
end
