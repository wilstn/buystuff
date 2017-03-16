Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'products#index'

  resources :products do
    resources :orders, only: [:new]
  end

  resources :carts do
    resources :orders
  end
end
