class Image < ApplicationRecord
  def product
    Product.find_by(id: product_id)
  end
end

# on products, be able to view all image urls -> product.images
