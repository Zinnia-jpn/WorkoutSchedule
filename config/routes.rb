Rails.application.routes.draw do

  # records
  get "record/dynamic_select_category" => "records#dynamic_select_category" # Ajax送信先(多階層構造のセレクトボックスに使用)
  post "record/create" => "records#create"
  get "record/new" => "records#new"

  # schedules
  get "schedule" => "schedules#index"

  # sessions
  post "logout" => "sessions#logout"
  post "login" => "sessions#login"
  get "login" => "sessions#login_form"

  # users
  post "user/update" => "users#update"
  get "user/edit" => "users#edit"
  post "user/create" => "users#create"
  get "signup" => "users#new"
  get "user" => "users#show"

  # homes
  root "homes#top"
end
