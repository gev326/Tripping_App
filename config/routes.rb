Rails.application.routes.draw do
  get 'guests/new'

  get 'guests/create'

   #root 'trip#index'
  root 'welcome#index'
  #root 'users#index'
  resources :users
 resources :sessions, only: [:index, :new, :create, :edit, :destroy]
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'

  resources :trips
  resources :activities

  resources :guests, only: [:new, :create]

end
