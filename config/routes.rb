require 'sidekiq/web'
Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  mount Sidekiq::Web => '/sidekiq'

  root "home#index"

  get "/home", to: "home#index"

  get "/users", to: "users#index"
  get "/users/sign_up", to: "users#new"
  post "/users", to: "users#create"
  get "/users/:id", to: "users#show", as: "user"

  get "/sessions/new", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  delete "/sessions/:id", to: "sessions#destroy", as: "sessions_destroy"

  get "/posts", to: "posts#index"
  get "/posts/new", to: "posts#new"
  get "/posts/:id", to: "posts#show", as: "post"
  post "/posts", to: "posts#create"
  delete "/posts/:id", to: "posts#destroy", as: "delete_post"


  post "/posts/:post_id/comments", to: "comments#create"

  resources :payments, only: %i[new]

  post "payments/create" 
  get "payments/success"
  get "payments/cancel"

  resources :plans, only: %i[new]
  post "plans/create"
end
