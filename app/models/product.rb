class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, length: { maximum: 100 }
  validates :inventory, numericality: true
  belongs_to :supplier
  has_many :orders
  has_many :images
  has_many :category_products
  has_many :categories, through: :category_products
  has_many :carted_products

  def is_discounted?
    return price < 10
  end

  def tax
    return price * 0.09
  end

  def total
    return price + tax
  end

  # def categories -- under the hood
  #   category_products.map do |category_product|
  #     category_product.category
  #   end
  # end

  # # belongs_to -- under the hood
  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end

  # # has_many -- under the hood
  # def images
  #   Image.where(product_id: id)
  # end
end
