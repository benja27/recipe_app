class ShoppingListsController < ApplicationController
  def general_shopping_list
    @user = current_user # Assuming you have a method to get the logged-in user
    @recipes = @user.recipes.includes(:foods)
  end
end
