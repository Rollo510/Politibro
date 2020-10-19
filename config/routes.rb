Rails.application.routes.draw do
  get 'users/index'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", registrations: 'registrations'}
  resources :users
  get '/users/:user_id/memes', to: 'users#index', as: 'user_memes'
  resources :memes do
      resources :comments
  end
  resources :comments
  get '/safe_for_work_memes', to: 'memes#safe_for_work', as: 'safe_for_work_memes'
  root 'memes#index'
  
end
