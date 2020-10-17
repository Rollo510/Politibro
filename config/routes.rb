Rails.application.routes.draw do
  get 'users/index'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", registrations: 'registrations'}
  resources :users
  get '/users/:user_id/memes', to: 'users#index', as: 'user_memes'
  resources :memes do
      resources :comments
  end
  resources :comments
  root 'memes#index'
  
end
