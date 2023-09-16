require 'rails_helper'

RSpec.describe Recipe, type: :model do



  let(:user) { FactoryBot.create(:user) }

  it "is valid with valid attributes" do
    recipe = FactoryBot.build(:recipe, user: user)
    expect(recipe).to be_valid
  end

  it "is not valid without a name" do
    recipe = FactoryBot.build(:recipe, name: nil, user: user)
    expect(recipe).to_not be_valid
  end

  it "is not valid with a short name" do
    recipe = FactoryBot.build(:recipe, name: "A", user: user)
    expect(recipe).to_not be_valid
  end

  it "is not valid with a long name" do
    name = "A" * 21
    recipe = FactoryBot.build(:recipe, name: name, user: user)
    expect(recipe).to_not be_valid
  end

  it "is not valid without a preparation_time" do
    recipe = FactoryBot.build(:recipe, preparation_time: nil, user: user)
    expect(recipe).to_not be_valid
  end

  it "is not valid with a negative preparation_time" do
    recipe = FactoryBot.build(:recipe, preparation_time: -1, user: user)
    expect(recipe).to_not be_valid
  end

  it "is valid with a zero preparation_time" do
    recipe = FactoryBot.build(:recipe, preparation_time: 0, user: user)
    expect(recipe).to be_valid
  end

  it "is valid with a positive preparation_time" do
    recipe = FactoryBot.build(:recipe, preparation_time: 30, user: user)
    expect(recipe).to be_valid
  end

  it "is not valid without a cooking_time" do
    recipe = FactoryBot.build(:recipe, cooking_time: nil, user: user)
    expect(recipe).to_not be_valid
  end

  it "is not valid with a negative cooking_time" do
    recipe = FactoryBot.build(:recipe, cooking_time: -1, user: user)
    expect(recipe).to_not be_valid
  end

  it "is valid with a zero cooking_time" do
    recipe = FactoryBot.build(:recipe, cooking_time: 0, user: user)
    expect(recipe).to be_valid
  end

  it "is valid with a positive cooking_time" do
    recipe = FactoryBot.build(:recipe, cooking_time: 45, user: user)
    expect(recipe).to be_valid
  end

  it "is not valid without a description" do
    recipe = FactoryBot.build(:recipe, description: nil, user: user)
    expect(recipe).to_not be_valid
  end

  it "is not valid with a short description" do
    recipe = FactoryBot.build(:recipe, description: "A" * 2, user: user)
    expect(recipe).to_not be_valid
  end

  it "is not valid with a long description" do
    description = "A" * 201
    recipe = FactoryBot.build(:recipe, description: description, user: user)
    expect(recipe).to_not be_valid
  end

  it "is not valid without a public flag" do
    recipe = FactoryBot.build(:recipe, public: nil, user: user)
    expect(recipe).to be_valid
  end

  it "is not valid without a user" do
    recipe = FactoryBot.build(:recipe, user: nil)
    expect(recipe).to_not be_valid
  end

  it "belongs to a user" do
    recipe = FactoryBot.create(:recipe, user: user)
    expect(recipe.user).to eq(user)
  end

  it "has many recipe_food" do
    recipe = FactoryBot.create(:recipe, user: user)
    recipe_food = FactoryBot.create(:recipe_food, recipe: recipe)
    expect(recipe.recipe_food).to include(recipe_food)
  end

  
end
