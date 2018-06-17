Rails.application.routes.draw do
	get '/login', to: 'sessions#new'
	post '/login', to: 'sessions#create'
	delete '/logout', to: 'sessions#destroy'

  root 'products#index'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  
  resources :users
  resources :products, only: [:show]
  resources :shopping_carts, only: [:create, :destroy, :index, :update] 
  resources :orders, only: [:index, :create, :show]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
