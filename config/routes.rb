Rails.application.routes.draw do

  root 'categories#index'
  get '/', to: 'categories#index'

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :articles, only: [:index, :show, :new, :create] do
    resources :votes, only: %i[create destroy]
  end
  resources :categories, only: [:show]

end
