class Order < ApplicationRecord
  belongs_to :user
  has_many :carted_products
  has_many :products, through: :carted_products
end

# create order controller with create action
# create order instance with user_id and product_id and quantity keys
#
# user can loop through all available products
# compare quantity that a user selects against the inventory the product has
#
