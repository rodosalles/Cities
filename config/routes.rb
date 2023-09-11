Rails.application.routes.draw do
  root 'countries#index'

  resources :countries do
    resources :states
  end

  resources :states, only: [] do
    resources :cities
  end
end
