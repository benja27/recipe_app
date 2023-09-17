require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:user) { FactoryBot.create(:user) }



  it 'is not valid with a negative preparation_time' do
    recipe = FactoryBot.build(:recipe, preparation_time: -1, user:)
    expect(recipe).to_not be_valid
  end

  it 'is valid with a zero preparation_time' do
    recipe = FactoryBot.build(:recipe, preparation_time: 0, user:)
    expect(recipe).to be_valid
  end

  it 'is valid with a positive preparation_time' do
    recipe = FactoryBot.build(:recipe, preparation_time: 30, user:)
    expect(recipe).to be_valid
  end

  it 'is not valid without a cooking_time' do
    recipe = FactoryBot.build(:recipe, cooking_time: nil, user:)
    expect(recipe).to_not be_valid
  end

  it 'is not valid with a negative cooking_time' do
    recipe = FactoryBot.build(:recipe, cooking_time: -1, user:)
    expect(recipe).to_not be_valid
  end

  it 'is valid with a zero cooking_time' do
    recipe = FactoryBot.build(:recipe, cooking_time: 0, user:)
    expect(recipe).to be_valid
  end

  it 'is valid with a positive cooking_time' do
    recipe = FactoryBot.build(:recipe, cooking_time: 45, user:)
    expect(recipe).to be_valid
  end

  it 'is not valid without a description' do
    recipe = FactoryBot.build(:recipe, description: nil, user:)
    expect(recipe).to_not be_valid
  end

  it 'is not valid with a short description' do
    recipe = FactoryBot.build(:recipe, description: 'A' * 2, user:)
    expect(recipe).to_not be_valid
  end
end


RSpec.describe Recipe, type: :model do
  let(:user) { FactoryBot.create(:user) }

  it 'is not valid with a long description' do
    description = 'A' * 201
    recipe = FactoryBot.build(:recipe, description:, user:)
    expect(recipe).to_not be_valid
  end

  it 'is not valid without a public flag' do
    recipe = FactoryBot.build(:recipe, public: nil, user:)
    expect(recipe).to be_valid
  end

  it 'is not valid without a user' do
    recipe = FactoryBot.build(:recipe, user: nil)
    expect(recipe).to_not be_valid
  end

  it 'belongs to a user' do
    recipe = FactoryBot.create(:recipe, user:)
    expect(recipe.user).to eq(user)
  end

  it 'has many recipe_food' do
    recipe = FactoryBot.create(:recipe, user:)
    recipe_food = FactoryBot.create(:recipe_food, recipe:)
    expect(recipe.recipe_food).to include(recipe_food)
  end



  it 'is not valid without preparation time' do
    recipe = Recipe.new(
      name: 'Example Recipe',
      cooking_time: 60,
      description: 'A delicious recipe.'
    )

    expect(recipe).to_not be_valid
  end

  it 'is not valid without cooking time' do
    recipe = Recipe.new(
      name: 'Example Recipe',
      preparation_time: 30,
      description: 'A delicious recipe.'
    )

    expect(recipe).to_not be_valid
  end

  it 'is not valid without a description' do
    recipe = Recipe.new(
      name: 'Example Recipe',
      preparation_time: 30,
      cooking_time: 60
    )

    expect(recipe).to_not be_valid
  end
end

RSpec.describe Recipe, type: :model do
  let(:user) { FactoryBot.create(:user) }
  it 'is valid with valid attributes' do
    FactoryBot.build(:recipe, user:)
  end

  it 'is valid with valid attributes' do
    user = User.create(
      name: 'John Doe',
      email: 'john@example.com',
      password: 'password'
    )

    recipe = Recipe.new(
      name: 'Example Recipe',
      preparation_time: 30,
      cooking_time: 60,
      description: 'A delicious recipe.',
      user:
    )

    expect(recipe).to be_valid
  end

  it 'is not valid without a name' do
    recipe = FactoryBot.build(:recipe, name: nil, user:)
    expect(recipe).to_not be_valid
  end

  it 'is not valid with a short name' do
    recipe = FactoryBot.build(:recipe, name: 'A', user:)
    expect(recipe).to_not be_valid
  end

  it 'is not valid with a long name' do
    name = 'A' * 51
    recipe = FactoryBot.build(:recipe, name:, user:)
    expect(recipe).to_not be_valid
  end

  it 'is not valid without a preparation_time' do
    recipe = FactoryBot.build(:recipe, preparation_time: nil, user:)
    expect(recipe).to_not be_valid
  end
end
