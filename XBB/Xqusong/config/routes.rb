Rails.application.routes.draw do
  devise_for :couriers
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :couriers


  #root 'sessions#new'
end
