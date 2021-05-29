Rails.application.routes.draw do

  root 'categories#index'
  get '/', to: 'categories#index'

  resources :users, only: [:index, :show, :new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :articles, only: [:index, :show, :new, :create]
  resources :categories, only: [:show]

end
