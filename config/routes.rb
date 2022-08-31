Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/products", controller: "products", action: "product_all"
  get "/product_notebook", controller: "products", action: "product_notebook"
  get "/product_pen", controller: "products", action: "product_pen"
  get "/product_printer", controller: "products", action: "product_printer"
  # alternate syntax -- get "/product_printer" => "products#product_printer"
end
