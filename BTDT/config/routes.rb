Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#home', as: 'home' #WORKING
  get '/login', to: 'users#login', as: 'login' #WORKING
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  resources :posts#WORKING
  resources :comments#WORKING
  resources :users#WORKING
  resources :countries, only: [:index, :show]#WORKING
  resources :visits, only: [:index, :new, :create, :show]#WORKING
  resources :sessions, only: [:create, :new, :destroy]
end
