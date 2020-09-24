Rails.application.routes.draw do

  get "login" => "homes#login_form"
  get "user" => "users#show"
  get "/" => "homes#top"
end
