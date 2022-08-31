# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Product.create({
  name: "notebook",
  price: 16,
  image_url: "https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1593553071-cute-notebooks-walmart-1593553032.jpg",
  description: "Spiral bound, hard cover notebook and solid lines.",
})

Product.create({
  name: "Pilot Juice Up 04",
  price: 3,
  image_url: "https://cdn.shopify.com/s/files/1/1717/0621/products/DSC_7079_c3681b29-21f6-4972-8144-414386f7c524_1024x1024.jpg?v=1625062397",
  description: "Pilot brand pen, available in multi-color packs.",
})

Product.create({
  name: "Poooli Printer",
  price: 21,
  image_url: "https://i.ebayimg.com/thumbs/images/g/3aYAAOSwDANhqFKt/s-l1600.jpg",
  description: "Thermal printer for text, photos and stickers.",
})
