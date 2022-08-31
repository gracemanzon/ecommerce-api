class ProductsController < ApplicationController
  def display_product
    products = Product.all
    render json: products.as_json
  end
end
