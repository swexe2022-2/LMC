Rails.application.routes.draw do
  resources :users
  resources :recipes
  root 'recipes#index'
  post 'top#login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
