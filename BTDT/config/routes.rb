Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts
  resources :comments
  resources :users
  resources :countries, only: [:index, :show]
  resources :visits, only: [:index, :new, :create, :show]
  get '/home', to: 'users#home'#WORKING
end
