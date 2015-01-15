Rails.application.routes.draw do
  root 'listings#index'
  devise_for :users
  resources :users, only: [:show]

  resources :listings do
    resources :reservations, only: [:new, :show, :create, :show, :destroy, :edit, :update]
  end
  resources :listings, only: [:show] do
    resources :reviews, only: [:new, :create, :edit, :destroy, :update]
  end
end
