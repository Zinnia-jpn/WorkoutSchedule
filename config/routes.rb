Rails.application.routes.draw do

  get "user" => "users#show"
  get "/" => "homes#top"
end
