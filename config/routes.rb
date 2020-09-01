Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  
  resources :items, only: [:index, :show]
  resources :carts, only: [:show, :update, :destroy]
  resources :charges, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
