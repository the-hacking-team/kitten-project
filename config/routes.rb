Rails.application.routes.draw do

  root 'item#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :item, only: [ :index, :show]
end
