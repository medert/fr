Rails.application.routes.draw do
  root "trips#index"
  devise_for :users, controllers: { registrations: 'registrations' }

  resources :users, only: [:show]

  resources :trips do
    resources :reviews
  end
end
