class ProductsController < ApplicationController
  def product_all
    products = Product.all
    render json: products.as_json
  end

  def product_notebook
    product = Product.find_by(id: 1)
    render json: product.as_json
  end

  def product_pen
    product = Product.find_by(id: 3)
    render json: product.as_json
  end

  def product_printer
    product = Product.find_by(id: 6)
    render json: product.as_json
  end
end
