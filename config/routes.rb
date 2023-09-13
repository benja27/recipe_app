Rails.application.routes.draw do
  resources :foods
  resources :recipes do 
    member do 
      patch :update_public
    end
  end
  devise_for :users  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "recipes#index"
end
