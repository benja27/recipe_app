FactoryBot.define do
  factory :food do
    name { Faker::Lorem.words(number: 1) }
    price { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
    quantity { Faker::Number.between(from: 1, to: 100) }
    user_id { create(:user).id }
    measurement_unit { %w[grams ounces liters].sample }
  end
end
