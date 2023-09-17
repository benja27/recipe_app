class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food

  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :recipe_id, presence: true, uniqueness: { scope: :food_id }
  validates :food_id, presence: true, uniqueness: { scope: :recipe_id }
end
