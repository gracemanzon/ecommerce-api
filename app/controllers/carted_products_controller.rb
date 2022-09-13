class CartedProductsController < ApplicationController
  def create
    cartedproduct = CartedProduct.new(
      user_id: params["user_id"],
      product_id: params["product_id"],
      quantity: params["quantity"],
      status: params["status"],
      order_id: params["order_id"],
    )

    if cartedproduct.save
      render json: { message: "your product has been added to the cart!" }
    else
      render json: { error: "your product has not been added to cart." }
    end
  end
end
