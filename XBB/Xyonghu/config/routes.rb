Rails.application.routes.draw do
  resources :products
  resources :categories do 
    resources :products
  end
  resources :cities
  resources :price_rules
  resources :prices
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
