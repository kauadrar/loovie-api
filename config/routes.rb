require "sidekiq/web"

Rails.application.routes.draw do
  resources :tags
  resources :normal_posts
  resources :characters
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount Sidekiq::Web => "/sidekiq"

  resources :movie_translations
  resources :show_translations
  resources :season_translations
  resources :languages
  resources :sub_genres
  resources :genres
  resources :casts
  resources :crews
  resources :people
  resources :episodes
  resources :seasons
  resources :shows
  resources :movies
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  devise_for :users, path: "", path_names: {
    sign_in: "login",
    sign_out: "logout",
    registration: "signup"
  }, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }

  get "me", to: "users#me"
end
