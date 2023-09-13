# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

rails g model recipe_food food:references recipe:references quantity:float

# Crear usuarios de ejemplo
# Crear recetas de ejemplo para los usuarios

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



14.times do |i|
  Food.create!(
    name: "Ingrediente #{i}",
    measurement_unit: 'gramos',
    price: 2.5,
    quantity: 200,
    user: User.first
  )
end


