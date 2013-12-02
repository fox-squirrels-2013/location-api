LocationApi::Application.routes.draw do
  root to: 'stores#index'
  resources :stores, only: [:index] do
    resources :locations do
      resources :discounts
    end
  end
end
