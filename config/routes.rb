LocationApi::Application.routes.draw do
  root to: 'discounts#index'
  resources :discounts
end
