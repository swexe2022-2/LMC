Rails.application.routes.draw do
  resources :users, only: [:new, :create, :destroy, :edit, :update, :show]
  resources :recipes
  root 'recipes#index'
  get 'get_reciepe/:id', to: 'recipes#get_reciepe'
  get 'get_reciepe2/:id', to: 'recipes#get_reciepe2'
  get 'search' => 'recipes#search'
  get 'tag_search' => 'recipes#tag_search'



  get 'top/main'
  post 'top/login'
  post 'top/logout'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
