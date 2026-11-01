Rails.application.routes.draw do
  root "animals#index"

  resources :animals, only: %i[index show new create edit update] do
    resource :favorite, only: %i[create destroy], controller: "animal_favorites"
  end
  get "popular", to: "animals#popular", as: :popular_animals
  resources :favorites, only: :index

  resource :session, only: %i[new create destroy]
  get "login", to: "sessions#new", as: :login
  get "register", to: "users#new", as: :register
  get "forgot-password", to: "users#forgotten", as: :forgot_password
  post "forgot-password", to: "users#forgotten"
  resources :users, only: %i[index new create show]

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

end
