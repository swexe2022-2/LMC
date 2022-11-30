Rails.application.routes.draw do

  resources :users, only: [:new, :create, :destroy, :edit, :update, :show]
  resources :recipes
  root 'recipes#index'
  get 'get_reciepe/:id', to: 'recipes#get_reciepe'
  get 'get_reciepe2/:id', to: 'recipes#get_reciepe2'
  get 'search' => 'recipes#search'


  get 'top/main'
  post 'top/login'
  post 'top/logout'
end
