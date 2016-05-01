Rails.application.routes.draw do
  devise_for :users

  root 'home#show', via: :get
  resource :dashboard, only: [ :show ]
  resources :text_shouts, only: [ :create ]
  resources :photo_shouts, only: [ :create ]
  resources :shouts, only: [ :show ]
  resources :users, only: [ :show, :index ] do
    post 'follow' => 'following_relationships#create'
    delete 'follow' => 'following_relationships#destroy'
  end
  resources :hashtags, only: [ :show ]
  resource :search, only: [ :show ]
end
