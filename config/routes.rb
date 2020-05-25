Rails.application.routes.draw do

  devise_for :users
  root 'static#home'
  devise_scope :user do
    get 'signup' => 'devise/registrations#new'
    get '/login' => 'devise/sessions#new'
    delete '/logout' => 'devise/sessions#destroy'
  end

  resources :characters
  resources :movies
  resources :people
  resources :reviews
  resources :genres
  resources :users,  only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
