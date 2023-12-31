class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /recipes or /recipes.json
  def index
    @recipes = Recipe.where(user_id: current_user.id)
  end

  # app/controllers/recipes_controller.rb
  def update_switch_state
    recipe = Recipe.find(params[:recipe_id])
    new_state = params[:new_state] == 'true' # Convert the string to a boolean

    # Update the state in the database
    recipe.update(public: new_state)

    if recipe.save
      render json: { message: 'Switch state updated successfully' }
    else
      render json: { message: 'Switch state update failed' }, status: :unprocessable_entity
    end
  end

  # GET /recipes/1 or /recipes/1.json
  def show
    # @test = RecipeFood.where(recipe_id: @recipe.id).each do |recipe_food|
    #   recipe_food.food = Food.find(recipe_food.food_id)
    # end
    authorize! :read, @recipe
    @test = RecipeFood.where(recipe_id: @recipe.id)
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit
    authorize! :read, @recipe
  end

  # POST /recipes or /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to recipe_url(@recipe), notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1 or /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to recipe_url(@recipe), notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def public_recipes
    @recipes = Recipe.where(public: true)
    # @recipes = Recipe.all
  end

  # def recipe_params
  #   params.require(:recipe).permit(:public)
  # end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.recipe_food.destroy_all
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public, :user_id)
  end
end
