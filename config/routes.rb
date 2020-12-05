Rails.application.routes.draw do

  get "workout/dynamic_select_muscle_part" => "workouts#dynamic_select_muscle_part" # Ajax送信先(多階層構造のセレクトボックスに使用)
  post "workout/create" => "workouts#create"
  get "workout/new" => "workouts#new"

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
