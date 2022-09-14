class OrdersController < ApplicationController
  before_action :authenticate_user

  def create
    carted_products = current_user.carted_products.where(status: "carted")

    subtotal = 0
    tax = 0
    total = 0

    carted_products.each do |carted_product|
      product = carted_product.product
      subtotal += product.price * carted_product.quantity
      tax += product.tax * carted_product.quantity
      total += subtotal + tax
    end

    @order = Order.new(
      user_id: current_user.id,
      subtotal: subtotal,
      tax: tax,
      total: total,
    )

    if @order.save
      # carted_products.update_all(status: "purchased", order_id: @order.id)
      carted_products.each do |carted_product|
        carted_product.status = "purchased"
        carted_product.order_id = @order.id
        carted_product.save
      end
      render template: "orders/show"
    else
      render json: { error: "order not saved properly" }
    end
  end

  def show
    @order = Order.find_by(id: params["id"])

    if current_user.id == @order.user_id
      render template: "orders/show"
    else
      render json: { message: "you are not authorized to view this page" }, status: :unauthorized
    end
  end

  def index
    @orders = current_user.orders
    render template: "orders/index"
  end
end
