class Food < ApplicationRecord
  belongs_to :user  
  has_many :recipes_food
  
end
