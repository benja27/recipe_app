FactoryBot.define do
  factory :recipe_food do
    food_id { create(:food).id }
    recipe_id { create(:recipe).id }
    quantity { Faker::Number.between(from: 1, to: 100) }
  end
end
