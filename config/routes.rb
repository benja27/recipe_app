Rails.application.routes.draw do
  get 'shopping_lists/show'
  get 'general_shopping_list', to: 'shopping_lists#index', as: :shopping_lists_index
  get 'general_shopping_list', to: 'shopping_lists#index'  
  # config/routes.rb
  post '/recipes/update_switch_state', to: 'recipes#update_switch_state'

  get '/public_recipes', to: 'recipes#public_recipes'
  resources :recipe_foods
  resources :foods
    # config/routes.rb
  resources :recipes do
    member do
      post 'update_switch_state'
    end
  end
  resources :shopping_lists, only: [:index] do
    collection do
      get 'general_shopping_list'
    end
  end  
 
  devise_for :users 
  # get '/public_recipes', to: 'recipes#public_recipes'
  # get '/public_recipes', to: 'recipes#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  root "recipes#index"
end
