FactoryBot.define do
  factory :user, class: User do
    name { "Name Sample" }
    email { "mail-sample@rails.com" }
    image { "image.jpeg" }
    password { "Password_sample1" }
  end

  factory :user_2, class: User do
    name { "Name Sample_2" }
    email { "mail-sample_2@rails.com" }
    image { nil }
    password { "Password_sample2" }
  end
end
