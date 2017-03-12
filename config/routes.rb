Rails.application.routes.draw do
  devise_for :users
  root 'products#index'

  resources :products do
    resources :orders do
      resources :payments
    end
  end
end
