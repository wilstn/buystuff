Rails.application.routes.draw do
  root 'products#index'

  resources :products do
    resources :orders do
      resources :payments
    end
  end
end
