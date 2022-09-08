class Order < ApplicationRecord
  belongs_to :product
  belongs_to :user
end

# create order controller with create action
# create order instance with user_id and product_id and quantity keys
#
# user can loop through all available products
# compare quantity that a user selects against the inventory the product has
#
