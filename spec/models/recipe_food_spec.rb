require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  let(:food) { FactoryBot.create(:food) }
  let(:recipe) { FactoryBot.create(:recipe) }

  it 'is valid with valid attributes' do
    recipe_food = FactoryBot.build(:recipe_food, food:, recipe:)
    expect(recipe_food).to be_valid
  end

  it 'is not valid without a quantity' do
    recipe_food = FactoryBot.build(:recipe_food, food:, recipe:, quantity: nil)
    expect(recipe_food).to_not be_valid
  end

  it 'is not valid with a negative quantity' do
    recipe_food = FactoryBot.build(:recipe_food, food:, recipe:, quantity: -1)
    expect(recipe_food).to_not be_valid
  end

  it 'is valid with a zero quantity' do
    recipe_food = FactoryBot.build(:recipe_food, food:, recipe:, quantity: 0)
    expect(recipe_food).to be_valid
  end

  it 'is valid with a positive quantity' do
    recipe_food = FactoryBot.build(:recipe_food, food:, recipe:, quantity: 50)
    expect(recipe_food).to be_valid
  end

  it 'is not valid without a recipe_id' do
    recipe_food = FactoryBot.build(:recipe_food, food:, recipe: nil)
    expect(recipe_food).to_not be_valid
  end

  it 'is not valid without a food_id' do
    recipe_food = FactoryBot.build(:recipe_food, food: nil, recipe:)
    expect(recipe_food).to_not be_valid
  end

  it 'validates uniqueness of recipe_id scoped to food_id' do
    FactoryBot.create(:recipe_food, food:, recipe:)
    recipe_food2 = FactoryBot.build(:recipe_food, food:, recipe:)
    expect(recipe_food2).to_not be_valid
  end

  it 'validates uniqueness of food_id scoped to recipe_id' do
    FactoryBot.create(:recipe_food, food:, recipe:)
    recipe_food2 = FactoryBot.build(:recipe_food, food:, recipe:)
    expect(recipe_food2).to_not be_valid
  end

  it 'belongs to a recipe' do
    recipe_food = FactoryBot.create(:recipe_food, food:, recipe:)
    expect(recipe_food.recipe).to eq(recipe)
  end

  it 'belongs to a food' do
    recipe_food = FactoryBot.create(:recipe_food, food:, recipe:)
    expect(recipe_food.food).to eq(food)
  end
end
