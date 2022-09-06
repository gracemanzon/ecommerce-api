class SuppliersController < ApplicationController
  def index
    suppliers = Supplier.all
    render json: { message: suppliers }
  end
end
