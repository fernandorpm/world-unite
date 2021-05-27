Rails.application.routes.draw do

  root 'articles#index'

  resources :users, only: [:index, :show, :new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :articles, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :categories, only: [:index, :show]

end
