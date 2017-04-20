Rails.application.routes.draw do
  get 'static_pages/home'

  get 'static_pages/help'

  resources :microposts
  resources :users
  # root 'application#hello'
  root 'users#index'
  # root 'users#edit'
end