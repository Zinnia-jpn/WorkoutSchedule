Rails.application.routes.draw do

  post "logout" => "homes#logout"
  get "login" => "homes#login_form"
  post "login" => "homes#login"
  get "user" => "users#show"
  get "/" => "homes#top"
end
