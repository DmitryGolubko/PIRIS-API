Rails.application.routes.draw do
  resources :disabilities
  resources :countries
  resources :civil_statuses
  resources :clients
  resources :cities
  resources :currencies
  resources :deposit_types
  resources :deposits
  resources :credit_types
  resources :credits
  resources :accounts, only: %i[index show]
  resources :credit_contracts, only: %i[create show]
  resources :deposit_contracts, only: %i[create show]
  get 'route_to_the_dream', controller: :bank
  namespace :atm do
    post 'login'
    get 'balance'
    post 'credit_withdraw'
    post 'credit_payment'
    post 'deposit_withdraw'
  end
  namespace :bank do
    get 'close_day'
  end
  root 'clients#index'
end
