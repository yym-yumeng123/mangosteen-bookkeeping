Rails.application.routes.draw do
  # Defines the root path route ("/")
  # root "articles#index"
  get "/users/:id", to: "users#show"
  post "/users", to: "users#create"

  namespace :api do
    namespace :v1 do
      resources :validation_codes, only: [:create]
      resource :session, only: [:create, :destroy]
      resource :me, only: [:show]
      resources :items
      resources :tags
    end
  end
end
