Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", registrations: 'registrations'}
  resources :users
  resources :memes do
      resources :comments
  end
  root 'memes#index'
  
end
