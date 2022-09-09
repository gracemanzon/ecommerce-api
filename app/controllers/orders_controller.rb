class OrdersController < ApplicationController
  def create
    product = Product.find_by(id: params["product_id"])
    tax = product.price * 0.08

    order = Order.new(
      user_id: current_user.id,
      product_id: params["product_id"],
      quantity: params["quantity"],
      subtotal: product.price,
      tax: tax,
      total: product.price + tax,
    )

    if order.save
      render json: { message: "order saved properly" }
    else
      render json: { error: "order not saved properly" }
    end
  end

  def show
    order = Order.find_by(id: current_user.id)
    render json: { order: order.as_json }
  end

  def index
    orders = Order.all
    render json: { user_id: orders.as_json }
  end
end
