require "http"

response = HTTP.get("http://localhost:3000/products.json")
products = response.parse

pp products

# update = HTTP.patch("http://localhost:3000/products/5.json")
# product_update = update.parse

# pp product_update
