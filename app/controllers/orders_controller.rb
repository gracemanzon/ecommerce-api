class OrdersController < ApplicationController
  def create
    order = Order.new(
      user_id: params["user_id"],
      product_id: params["product_id"],
      quantity: params["quantity"],
      # static
      subtotal: params["subtotal"],
      tax: params["tax"],
      total: params["total"],
    )

    if order.save
      render json: { message: "order saved properly" }
    else
      render json: { error: "order not saved properly" }
    end
  end

  def show
    order = Order.find_by(id: params["id"])
    render json: { user_id: order.user_id, product_id: order.product_id, quantity: order.quantity, tax: order.tax, total: order.total }
  end

  def index
    orders = Order.all
    render json: { user_id: orders.as_json }
  end
end
