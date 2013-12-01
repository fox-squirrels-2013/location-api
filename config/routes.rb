LocationApi::Application.routes.draw do
  root to: 'discounts#index'

  # will probably need to pass :locations through :stores resources
  # this is because it belongs to :stores, and it needs to
  # be able to call location.stores on it
  resources :locations do
    # :discounts belongs to locations, so it has to go through :locations
    resources :discounts
  end
end
