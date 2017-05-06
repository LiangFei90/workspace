Rails.application.routes.draw do

  resources :orders
  devise_for :users

  resources :products
  resources :categories do 
    resources :products
  end
  resources :cities
  resources :price_rules
  resources :prices

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
