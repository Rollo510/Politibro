Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", registrations: 'registrations' }

    resources :memes do
      resources :comments
    end
    resources :users
    root 'memes#index'
  
end
