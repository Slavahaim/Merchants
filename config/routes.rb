Rails.application.routes.draw do
  resources :merchants
  devise_for :users
  resources :users
  get 'home', to: 'home#index'
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
