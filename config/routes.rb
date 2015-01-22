Rails.application.routes.draw do
  root 'listings#index'
  devise_for :users
  resources :users, only: [:show]

  resources :images, only: [:new, :create, :show, :delete, :edit, :update]


  resources :listings do
    resources :reservations, only: [:new, :show, :create, :destroy, :edit, :update]
  end
  resources :listings, only: [:show] do
    resources :reviews, only: [:new, :create, :edit, :destroy, :update]
  end
end
