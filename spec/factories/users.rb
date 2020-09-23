FactoryBot.define do
  factory :user, class: User do
    name { "Name Sample" }
    email { "mail-sample@rails.com" }
    image { "image.jpeg" }
    password { "password_sample" }
  end

  factory :user_2, class: User do
    name { "Name Sample_2" }
    email { "mail-sample_2@rails.com" }
    image { "image_2.jpeg" }
    password { "password_sample_2" }
  end
end
