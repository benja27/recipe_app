# require 'rails_helper'

# RSpec.describe "Foods", type: :request do

# end

require 'rails_helper'

RSpec.describe FoodsController, type: :controller do
  let(:valid_attributes) do
    { name: 'Food Name', measurement_unit: 'Grams', price: 10, quantity: 100, user_id: create(:user).id }
  end

  let(:invalid_attributes) do
    { name: '', measurement_unit: 'Grams', price: 10, quantity: 100, user_id: 1 }
  end

  let(:food) { Food.create!(valid_attributes) }

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
      it 'creates a new Food' do
        expect do
          post :create, params: { food: valid_attributes }
        end.to change(Food, :count).by(1)
      end

      it 'redirects to the created food' do
        post :create, params: { food: valid_attributes }
        expect(response).to redirect_to(food_path(Food.last))
      end
    end

    context 'with invalid params' do
      it 'returns a unsuccess response (i.e., to display the "new" template)' do
        post :create, params: { food: invalid_attributes }
        expect(response).to_not be_successful
      end
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: food.to_param }
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      get :edit, params: { id: food.to_param }
      expect(response).to be_successful
    end
  end

  describe 'PATCH #update' do
    context 'with valid params' do
      let(:new_attributes) { { name: 'Updated Food Name' } }

      it 'updates the requested food' do
        patch :update, params: { id: food.to_param, food: new_attributes }
        food.reload
        expect(food.name).to eq('Updated Food Name')
      end

      it 'redirects to the food' do
        patch :update, params: { id: food.to_param, food: valid_attributes }
        expect(response).to redirect_to(food_path(food))
      end
    end

    context 'with invalid params' do
      it 'returns a unsuccessfull response (i.e., to display the "edit" template)' do
        patch :update, params: { id: food.to_param, food: invalid_attributes }
        expect(response).to_not be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested food' do
      food # Ensure the food exists before the test
      expect do
        delete :destroy, params: { id: food.to_param }
      end.to change(Food, :count).by(-1)
    end

    it 'redirects to the foods list' do
      delete :destroy, params: { id: food.to_param }
      expect(response).to redirect_to(foods_url)
    end
  end
end
