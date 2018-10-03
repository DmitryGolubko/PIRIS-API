Rails.application.routes.draw do
  resources :countries
  resources :civil_statuses
  resources :clients
  resources :cities
  root 'clients#index'
end
