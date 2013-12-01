LocationApi::Application.routes.draw do
  root to: 'stores#index'
  resources :stores do
    resources :locations do
      resources :discounts
    end
  end
end
