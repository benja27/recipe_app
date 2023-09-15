class Recipe < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :recipe_food
end
