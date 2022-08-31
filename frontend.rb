require "http"

response = HTTP.get("http://localhost:3000/products.json")
products = response.parse

pp products
