Rails.application.routes.draw do
  resources :users, only: [:new, :create, :destroy]
  resources :recipes
  get 'recipes/{:id}', to: 'recipes#show'
  post 'recipes/{:id}/edit', to: 'recipes#edit'
  get 'users/{:id}', to: 'users#show'
  post 'users/{:id}/edit', to: 'users#edit'
  root 'recipes#index'
  post 'top/login'
  get 'get_reciepe/:id', to: 'recipes#get_reciepe'
  get 'get_reciepe2/:id', to: 'recipes#get_reciepe2'
  get 'search' => 'recipes#search'

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
