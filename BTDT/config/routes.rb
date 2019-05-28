Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts#WORKING
  resources :comments#WORKING
  resources :users#WORKING
  resources :countries, only: [:index, :show]#WORKING
  resources :visits, only: [:index, :new, :create, :show]#WORKING
  get '/home', to: 'users#home'#WORKING
end
