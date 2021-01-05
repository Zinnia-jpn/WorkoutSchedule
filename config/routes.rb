Rails.application.routes.draw do

  # records
  post "record/destroy" => "records#destroy"
  post "record/update" => "records#update"
  get "record/edit" => "records#edit"
  get "record/dynamic_select_category" => "records#dynamic_select_category" # Ajax送信先(二重構造のセレクトボックス)
  post "record/create" => "records#create"
  get "record/new" => "records#new"

  # schedules
  post "dynamic_select_month" => "schedules#dynamic_select_month" # 月ごとのスケジュール表示
  get "schedule/dynamic_select_date" => "schedules#dynamic_select_date" # Ajax送信先(前後3日間の切り替え)
  get "schedule/month" => "schedules#month"
  get "schedule/date" => "schedules#date"

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
