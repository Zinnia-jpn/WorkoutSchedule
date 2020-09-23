Rails.application.routes.draw do

  get 'users/show'
  get "/" => "homes#top"
end
