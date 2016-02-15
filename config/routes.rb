Rails.application.routes.draw do
  root 'listings#index'
  devise_for :users
  resources :users, only: [:show]

  resources :images, except: [:index]

  resources :listings do
    resources :reservations, except: [:index]
    resources :reviews, except: [:index, :show]
  end
end
