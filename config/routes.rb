Rails.application.routes.draw do

  get "schedule" => "schedules#index"
  post "logout" => "sessions#logout"
  post "login" => "sessions#login"
  get "login" => "sessions#login_form"
  post "user/update" => "users#update"
  get "user/edit" => "users#edit"
  post "user/create" => "users#create"
  get "signup" => "users#new"
  get "user" => "users#show"
  root "homes#top"
end
