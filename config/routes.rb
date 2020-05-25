Rails.application.routes.draw do

  root 'static#home'
  get 'signup' => 'static#signup'

  resources :characters
  resources :movies
  resources :people
  resources :reviews
  resources :genres
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
