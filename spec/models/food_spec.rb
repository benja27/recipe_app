require 'rails_helper'

RSpec.describe Food, type: :model do
  let(:food) { FactoryBot.create(:food)  }

  it "valdate the presense of name" do
    expect(food).to be_valid  
  end

  it "valdate the presense of price" do
    expect(food).to be_valid  
  end

  it "valdate the presense of quantity" do
    expect(food).to be_valid  
  end

  it "valdate the presense of measurement_unit" do
    expect(food).to be_valid  
  end

  it "fails validation with no name" do
    food.name = nil
    expect(food).to_not be_valid  
  end

  it "fails validation with no price" do
    food.price = nil
    expect(food).to_not be_valid  
  end

  it "fails validation with no quantity" do
    food.quantity = nil
    expect(food).to_not be_valid  
  end

  it "fails validation with no measurement_unit" do
    food.measurement_unit = nil
    expect(food).to_not be_valid  
  end

  it "fails when price is less than 0" do
    food.price = -1
    expect(food).to_not be_valid  
  end

  it "fails when quantity is less than 0" do
    food.quantity = -1
    expect(food).to_not be_valid  
  end

  it "fails when name is not unique" do
    food2 = FactoryBot.build(:food, name: food.name)
    expect(food2).to_not be_valid  
  end

  it "fails when name is less than 3 characters" do
    food.name = "a"
    expect(food).to_not be_valid  
  end

  it "fails when name is more than 20 characters" do
    food.name = "a" * 21
    expect(food).to_not be_valid  
  end

end
