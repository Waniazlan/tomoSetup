Rails.application.routes.draw do
  resources :posts
  
  # get "rooms/index"
  # get '/signin', to: 'sessions#new'
  # post '/signin', to: 'sessions#create'
  # delete '/signout', to: 'sessions#destroy'

  root 'categories#index'
  devise_for :users
  
  # resources :rooms do
  #   resources :messages
  # end

  # resources :users
  
  resources :categories do
    resources :products
  end
end
