class ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]

  def index
    @products = Product.all

    if params["category"]
      category = Category.find_by(name: params["category"])
      @products = category.products
    else
      render template: "products/index"
    end
  end

  def show
    @product = Product.find_by(id: params["id"])
    render template: "products/show"
  end

  def create
    # if current_user && current_user.admin
    @product = Product.new(
      name: params["name"],
      price: params["price"],
      description: params["description"],
      inventory: params["inventory"],
      supplier_id: params["supplier_id"],
    )

    if @product.save
      Image.create(url: params["image_url"], product_id: @product.id)
      render template: "products/show"
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
    # else
    #  render json: {}, status: :unauthorized
    # end
  end

  def update
    @product = Product.find_by(id: params["id"])
    @product.name = params["name"] || @product.name
    @product.price = params["price"] || @product.price
    @product.description = params["description"] || @product.description
    @product.inventory = params["inventory"] || @product.inventory

    if @product.save
      Image.update(url: params["image_url"], product_id: @product.id)
      render template: "products/show"
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    product = Product.find_by(id: params["id"])

    product.destroy
    render json: { message: "destroy message" }
  end
end
