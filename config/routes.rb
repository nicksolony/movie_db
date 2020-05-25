Rails.application.routes.draw do

  devise_for :users
  root 'static#home'
  get 'signup' => 'static#signup'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  resources :characters
  resources :movies
  resources :people
  resources :reviews
  resources :genres
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
