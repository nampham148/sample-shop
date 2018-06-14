Rails.application.routes.draw do
  get 'products/index'

	get '/login', to: 'sessions#new'
	post '/login', to: 'sessions#create'
	delete '/logout', to: 'sessions#destroy'

  root 'static_pages#home'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  
  resources :users
  resources :products, only: [:index, :show]
  resources :shopping_carts, only: [:create, :destroy, :index, :update] do
    collection do
      get 'order', to: 'shopping_carts#get_order'
      post 'order', to: 'shopping_carts#post_order'
    end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
