Rails.application.routes.draw do

  # records
  get "records/dynamic_select_category" => "records#dynamic_select_category" # Ajax送信先(二重構造のセレクトボックス)
  resources :records, param: :token, only: [:new, :create, :edit, :update, :destroy]

  # schedules
  get "schedule/receive_selection" => "schedules#receive_selection"
  get "schedule/month" => "schedules#month"
  get "schedule/day" => "schedules#day"

  # sessions
  post "logout" => "sessions#logout"
  post "login" => "sessions#login"
  get "login" => "sessions#login_form"

  # users
  post "user/revert_image" => "users#revert_image"
  delete "user/delete" => "users#destroy"
  patch "user/update" => "users#update"
  get "user/edit" => "users#edit"
  post "user/create" => "users#create"
  get "signup" => "users#new"
  get "user" => "users#show"

  # homes
  get "account/deleted" => "homes#account_deleted_notification"
  root "homes#top"
end
