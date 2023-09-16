class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_food

  validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 20 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :measurement_unit, presence: true

end
