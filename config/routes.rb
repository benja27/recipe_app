Rails.application.routes.draw do
  get '/public_recipes', to: 'recipes#public_recipes'
  resources :recipe_foods
  resources :foods
  resources :recipes     
  devise_for :users 
  # get '/public_recipes', to: 'recipes#public_recipes'
  # get '/public_recipes', to: 'recipes#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  root "recipes#index"
end
