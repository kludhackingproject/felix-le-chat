Rails.application.routes.draw do
  
  get 'carts/index'
  get 'carts/show'
  get 'carts/update'
  get 'carts/destroy'
  get 'carts/new'
  get 'carts/create'
  get 'carts/edit'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root 'items#index'
  resources :items
end
