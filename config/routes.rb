Rails.application.routes.draw do
  # get 'posts/index'
  # get 'posts/show'
  # get 'posts/new'
  # get 'sessions/new'
  # get 'users/index'
  # get 'users/show'
  # get 'users/new'


  root "home#index"

  get "/home", to: "home#index"

  get "/users", to: "users#index"
  get "/users/sign_up", to: "users#new"
  post "/users", to: "users#create"
  get "/users/:id", to: "users#show", as: "user"

  get "/sessions/new", to: "sessions#new"
  post "/sessions", to: "sessions#create"

  get "/posts", to: "posts#index"
  get "/posts/new", to: "posts#new"
  get "/posts/:id", to: "posts#show", as: "post"
  post "/posts", to: "posts#create"
  delete "/posts/:id", to: "posts#destroy", as: "delete_post"

  get "up" => "rails/health#show", as: :rails_health_check

end
