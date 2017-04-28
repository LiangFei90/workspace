Rails.application.routes.draw do


  
  resources :price_rules
  resources :prices
  #resources :products
  resources :categories do
    resources :products
    member do 
      get :prices
      post :init_prices
    end
  end

  resources :cities
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :workeraccounts

  resources :workeraccounts do 
    member do 
      get 'reset'=>'workeraccounts#reset' ,:as =>'reset_password'
      #put :change_current_city
    end
  end

  resources :stations do
  	collection do
  		get :suggestion
  	end
  end

  resources :couriers

  resources :factories

  resources :worker_messages

  resources :regions do 
    collection do 
      get :search
    end
  end

  root 'workeraccounts#index'

end
