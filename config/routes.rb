Rails.application.routes.draw do

  get "schedule" => "schedules#index"
  post "logout" => "sessions#logout"
  post "login" => "sessions#login"
  get "login" => "sessions#login_form"
  get "user" => "users#show"
  get "/" => "homes#top"
end
