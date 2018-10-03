Rails.application.routes.draw do
  resources :civil_statuses
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :clients
  resources :cities
  root 'clients#index'
end
