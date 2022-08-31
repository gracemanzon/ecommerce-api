class ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products.as_json
  end

  def show
    product = Product.find_by(id: params["id"])
    render json: product.as_json
  end

  def create
    product = Product.new(
      name: "Rubber Date Stamp",
      price: 18,
      image_url: "https://i.etsystatic.com/29642716/r/il/e95cce/3217855779/il_570xN.3217855779_9ock.jpg",
      description: "A set of wooden block stamps featuring assorted Months/Dates.",
    )
    product.save
    render json: product.as_json
  end
end
