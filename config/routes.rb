Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # products paths
  get "/products" => "products#index"
  get "/products/:id" => "products#show"
  post "/products" => "products#create"
  patch "/products/:id" => "products#update"
  delete "/products/:id" => "products#destroy"

  # suppliers paths
  get "/suppliers" => "suppliers#index"

  # users paths
  post "/users" => "users#create"
  post "/sessions" => "sessions#create"

  # orders paths
  post "/orders" => "orders#create"
  get "/orders/:id" => "orders#show"
  get "/orders" => "orders#index"

  # carted_products paths
  get "/carted_products" => "carted_products#index"
  post "/carted_products" => "carted_products#create"
  delete "/carted_products/:id" => "carted_products#destroy"
end
