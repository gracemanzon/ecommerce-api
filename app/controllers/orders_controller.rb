class OrdersController < ApplicationController
  def create
    product = Product.find_by(id: params["product_id"])
    subtotal = product.price * params["quantity"].to_i
    tax = product.tax * params["quantity"].to_i
    total = subtotal + tax

    order = Order.new(
      user_id: current_user.id,
      product_id: params["product_id"],
      quantity: params["quantity"],
      subtotal: subtotal,
      tax: tax,
      total: total,
    )

    if order.save
      render json: { message: "order saved properly", order: order.as_json }
    else
      render json: { error: "order not saved properly" }
    end
  end

  def show
    order = Order.find_by(id: params["id"])

    if current_user && current_user.id == order.user_id
      render json: { order: order.as_json }
    else
      render json: { message: "you are not authorized to view this page" }, status: :unauthorized
    end
  end

  def index
    if current_user
      orders = current_user.orders
      render json: { user_id: orders.as_json }
    else
      render json: { message: "please log in to view orders" }, status: :unauthorized
    end
  end
end
