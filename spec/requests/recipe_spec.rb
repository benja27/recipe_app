require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  include Devise::Test::ControllerHelpers
  let(:user) { FactoryBot.create(:user) } 
  let(:recipe) { FactoryBot.create(:recipe) }

  describe 'GET #index' do
    it 'returns a success response' do
      sign_in user
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      sign_in user
      get :new
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Recipe' do
        expect do
          sign_in user
          post :create, params: { recipe: FactoryBot.attributes_for(:recipe) }
        end.to change(Recipe, :count).by(1)
      end

      it 'redirects to the created recipe' do
        sign_in user
        post :create, params: { recipe: FactoryBot.attributes_for(:recipe) }
        expect(response).to redirect_to(recipe_url(Recipe.last))
      end
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      sign_in user
      get :show, params: { id: recipe.to_param }
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      sign_in user
      get :edit, params: { id: recipe.to_param }
      expect(response).to be_successful
    end
  end

  describe 'PATCH #update' do
    context 'with valid params' do
      it 'updates the requested recipe' do
        sign_in user
        new_attributes = FactoryBot.attributes_for(:recipe)
        patch :update, params: { id: recipe.to_param, recipe: new_attributes }
        recipe.reload
        expect(recipe.name).to eq(new_attributes[:name])
      end

      it 'redirects to the recipe' do
        sign_in user
        new_attributes = FactoryBot.attributes_for(:recipe)
        patch :update, params: { id: recipe.to_param, recipe: new_attributes }
        expect(response).to redirect_to(recipe_url(recipe))
      end
    end
  end

  describe 'DELETE #destroy' do    

    it 'redirects to the recipes list' do
      sign_in user
      delete :destroy, params: { id: recipe.to_param }
      expect(response).to redirect_to(recipes_url)
    end
  end
end
