Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'items#index'
  resources :items do #, only: [:index, :show, :new, :create]
  	resources :photos, only: [:create]
  end
  resources :carts
  resources :orders, only: [:create]
  resources :destroy_cart_items, only: [:destroy]

end

