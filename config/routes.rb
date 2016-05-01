Rails.application.routes.draw do
  devise_for :users

  root 'home#show', via: :get
  resource :dashboard, only: [ :show ]
  resources :text_shouts, only: [ :create ]
  resources :photo_shouts, only: [ :create ]
  resources :shouts, only: [ :show ]
  resources :users, only: [ :show ]
end
