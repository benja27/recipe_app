class ShoppingListsController < ApplicationController
  def index
    # @foods= Food.where(user_id: current_user.id)
    # @foods= RecipeFood.where(recipe_id: params[ :recipe_id ])
    
    
    user_recipes = Recipe.where(user_id: current_user.id)

    # Obtén los ids de las recetas del usuario actual
    user_recipe_ids = user_recipes.pluck(:id)

    # Encuentra todas las RecipeFood con recipe_id en la colección de user_recipe_ids
    # @recipe_foods = RecipeFood.where(recipe_id: user_recipe_ids)
    @foods = RecipeFood.where(recipe_id: user_recipe_ids)
  end

  def show
  end
end


