Rails.application.routes.draw do
  resources :comments
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, :comments, :posts
  resources :countries, only: [:index, :show]
  resources :visits, only: [:index, :new, :create, :show]
  get '/home', to: 'user#home'
end
