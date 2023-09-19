# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# rails g scaffold recipe_food food:references recipe:references quantity:float

# Crear usuarios de ejemplo
# Crear recetas de ejemplo para los usuarios

# require 'faker'




# 7.times do |i|
#   Recipe.create!(
#     name: "Receta #{i}",
#     preparation_time: 30.0,
#     cooking_time: 45.0,
#     description: 'Una deliciosa receta de prueba.',
#     public: true,
#     user_id: 1
#   )
# end



# 14.times do |i|
#   Food.create!(
#     name: "Ingrediente #{i}",
#     measurement_unit: 'grams',
#     price: 2.5,
#     quantity: 100,
#     user: User.first
#   )
# end


# 35.times do |i|
#   RecipeFood.create!(
#     food_id: Food.pluck(:id).sample,  # Asigna un food_id aleatorio de la tabla foods
#     recipe_id: Recipe.pluck(:id).sample,  # Asigna un recipe_id aleatorio de la tabla recipes
#     quantity: rand(1.0..10.0)  # Cantidad aleatoria entre 1.0 y 10.0
#   )
# end
require 'factory_bot'

# ... el resto de tus código de semilla ...


15.times do |i|
  FactoryBot.create(:food)
end

15.times do |i|
  FactoryBot.create(:recipe)
end