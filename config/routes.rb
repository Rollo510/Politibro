Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", registrations: 'registrations' }

    resources :users do
      resources :comments, only: [:index, :show]
    end
    
    resources :comments
    resources :memes
    root 'memes#index'
  
end
