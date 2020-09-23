FactoryBot.define do
  factory :user, class: User do
    name { "Name Sample" }
    email { "mail-sample@rails.com" }
    image { "image.jpeg" }
  end

  factory :user_2, class: User do
    name { "Name Sample_2" }
    email { "mail-sample_2@rails.com" }
    image { "image_2.jpeg" }
  end
end
