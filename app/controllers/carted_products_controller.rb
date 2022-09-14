class CartedProductsController < ApplicationController
  before_action :authenticate_user

  def index
    carted_products = current_user.carted_products.where(status: "carted")

    render json: { Your_Cart: carted_products.as_json }
  end

  def create
    cartedproduct = CartedProduct.new(
      user_id: current_user.id,
      product_id: params["product_id"],
      quantity: params["quantity"],
      status: "carted",
      order_id: nil,
    )

    if cartedproduct.save
      render json: { message: "your product has been added to the cart!" }
    else
      render json: { error: "your product has not been added to cart." }
    end
  end
end
