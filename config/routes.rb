Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :carts
      resources :cart_items
      resources :items
      resources :orders
      resources :order_items

      root to: "users#index"
    end
  devise_for :users
  root 'items#index'
  
  resources :users, only: [:show]
  resources :items, only: [:index, :show]
  resources :carts, only: [:show, :update, :destroy]
  resources :charges, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
