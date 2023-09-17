class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_food

  validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 50 }
  validates :preparation_time, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :cooking_time, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :description, presence: true, length: { minimum: 3, maximum: 200 }
  validates :user_id, presence: true
end
