Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'users/new'

  get 'home/index'
  root "home#index"

  get "/users", to: "users#index"
  post "/users", to: "users#create"
  get "/users/:id", to: "users#show"


  get "up" => "rails/health#show", as: :rails_health_check

end
