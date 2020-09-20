FactoryBot.define do
  factory :user do
    name { "Name Sample" }
    mail_address { "mail-sample@rails.com" }
    image { "image.jpeg" }
  end
end
