LocationApi::Application.routes.draw do
  root to: 'stores#index'
  resources :stores, only: [:index]
end
