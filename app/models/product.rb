class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, length: { maximum: 30 }
  validates :inventory, numericality: true
  validates :image_url, presence: true

  def is_discounted?
    return price < 10
  end

  def tax
    return price * 0.09
  end

  def total
    return price + tax
  end
end
