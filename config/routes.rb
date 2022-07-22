Rails.application.routes.draw do
  # Defines the root path route ("/")
  # root "articles#index"
  post "/users", to: "users#create"
  get "/users/:id", to: "users#show"
end
