Rails.application.routes.draw do
   #root 'trip#index'
  #root 'welcome#index'
  root 'users#index'
  resources :users
 resources :sessions, only: [:index, :new, :create, :edit, :destroy]
  get '/login', to: 'sessions#new'
get '/logout', to: 'sessions#destroy'

  resources :trip

end
