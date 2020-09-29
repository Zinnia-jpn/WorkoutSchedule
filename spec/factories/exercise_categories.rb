FactoryBot.define do
  factory :exercise_category do
    name { "MyString" }
    muscle_parts_id { 1 }
    whether_aerobic { false }
  end
end
