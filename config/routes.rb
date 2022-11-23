Rails.application.routes.draw do
  resources :users, only: [:new, :create, :destroy, :edit, :update, :show]
  resources :recipes
  root 'recipes#index'
  get 'top/main'
  post 'top/login'
  post 'top/logout'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
