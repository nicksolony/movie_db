Rails.application.routes.draw do

devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'static#home'
  devise_scope :user do
    get 'signup' => 'devise/registrations#new'
    get '/login' => 'devise/sessions#new'
    delete '/logout' => 'devise/sessions#destroy'
  end


  resources :movies do
    resources :characters, only: [:new,:create,:destroy]
  end
  resources :people
  resources :reviews
  resources :genres, only: [:index, :new, :create, :show]
  resources :users,  only: [:show]
   #[:index,:directed_movies,:written_movies,:filmography]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/people/:id/directed_movies' => 'people#directed_movies', as: 'directed_movies'
  get '/people/:id/written_movies' => 'people#written_movies', as: 'written_movies'
  get '/people/:id/filmography' => 'people#filmography', as: 'filmography'

  get '*path' => 'static#home'
end
