FactoryBot.define do
  factory :recipe do
    name { Faker::Lorem.words(number: 2).join(' ') }
    preparation_time { Faker::Number.between(from: 1, to: 100) }
    user_id { create(:user).id }
    cooking_time { Faker::Number.between(from: 1, to: 100) }
    description { Faker::Lorem.paragraph }
  end
end
