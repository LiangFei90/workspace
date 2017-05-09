Rails.application.routes.draw do

  devise_for :users
  resources :orders
  resources :users

  resources :categories do 
    resources :products
  end
  resources :cities
  resources :price_rules
  resources :prices
  resources :addresses do 
    collection do 
      get :suggestion
    end
  end
  root "categories#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
