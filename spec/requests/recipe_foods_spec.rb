require 'rails_helper'

RSpec.describe RecipeFoodsController, type: :controller do
  let(:recipe_food) { FactoryBot.create(:recipe_food) }

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new RecipeFood' do
        expect do
          post :create, params: { recipe_food: FactoryBot.attributes_for(:recipe_food) }
        end.to change(RecipeFood, :count).by(1)
      end

      it 'redirects to the created recipe_food' do
        post :create, params: { recipe_food: FactoryBot.attributes_for(:recipe_food) }
        expect(response).to redirect_to(recipe_food_url(RecipeFood.last))
      end
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: recipe_food.to_param }
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      get :edit, params: { id: recipe_food.to_param }
      expect(response).to be_successful
    end
  end

  describe 'PATCH #update' do
    context 'with valid params' do
      it 'updates the requested recipe_food' do
        new_attributes = FactoryBot.attributes_for(:recipe_food)
        patch :update, params: { id: recipe_food.to_param, recipe_food: new_attributes }
        recipe_food.reload
        expect(recipe_food.food_id).to eq(new_attributes[:food_id])
      end

      it 'redirects to the recipe_food' do
        new_attributes = FactoryBot.attributes_for(:recipe_food)
        patch :update, params: { id: recipe_food.to_param, recipe_food: new_attributes }
        expect(response).to redirect_to(recipe_food_url(recipe_food))
      end
    end
  end
  
end
