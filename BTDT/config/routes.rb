Rails.application.routes.draw do
  resources :comments
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, :comments, :posts #WORKING 
  resources :countries, only: [:index, :show] #WORKING
  resources :visits, only: [:index, :new, :create, :show] #WORKING
  get '/home', to: 'users#home'
end
