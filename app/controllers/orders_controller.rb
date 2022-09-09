class OrdersController < ApplicationController
  def create
    if current_user
      product = Product.find_by(id: params["product_id"])
      subtotal = product.price * params["quantity"].to_i
      tax = product.tax * params["quantity"].to_i
      total = subtotal + tax

      @order = Order.new(
        user_id: current_user.id,
        product_id: params["product_id"],
        quantity: params["quantity"],
        subtotal: subtotal,
        tax: tax,
        total: total,
      )

      if @order.save
        render template: "orders/show"
      else
        render json: { error: "order not saved properly" }
      end
    else
      render json: { message: "you must log in to create a new order" }, status: :unauthorized
    end
  end

  def show
    @order = Order.find_by(id: params["id"])

    if current_user && current_user.id == @order.user_id
      render template: "orders/show"
    else
      render json: { message: "you are not authorized to view this page" }, status: :unauthorized
    end
  end

  def index
    if current_user
      @orders = current_user.orders
      render template: "orders/index"
    else
      render json: { message: "please log in to view orders" }, status: :unauthorized
    end
  end
end
