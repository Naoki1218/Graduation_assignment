Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :estimates
  resources :products
  root 'estimates#index'
  get 'product/search' => 'products#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
