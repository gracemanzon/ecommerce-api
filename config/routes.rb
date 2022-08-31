Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/products", controller: "products", action: "product_all"

  get "/product_one/:id", controller: "products", action: "one_product"
  # get "/product_pen", controller: "products", action: "product_pen"
  # get "/product_printer", controller: "products", action: "product_printer"

  # alternate syntax -- get "/product_printer" => "products#product_printer"
end
