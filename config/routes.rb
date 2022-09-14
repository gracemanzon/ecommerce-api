Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # product paths
  get "/products" => "products#index"
  get "/products/:id" => "products#show"
  post "/products" => "products#create"
  patch "/products/:id" => "products#update"
  delete "/products/:id" => "products#destroy"

  # supplier paths
  get "/suppliers" => "suppliers#index"

  # user paths
  post "/users" => "users#create"
  post "/sessions" => "sessions#create"

  # order paths
  post "/orders" => "orders#create"
  get "/orders/:id" => "orders#show"
  get "/orders" => "orders#index"

  # cartedproduct paths
  get "/cartedproducts" => "carted_products#index"
  post "/cartedproducts" => "carted_products#create"
end
