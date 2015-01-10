Rails.application.routes.draw do
  root 'listings#index'
  devise_for :users
  resources :users, only: [:show]

  resources :listings do
    resources :reservations, only: [:create, :edit, :show, :update, :destroy]

  end
end
