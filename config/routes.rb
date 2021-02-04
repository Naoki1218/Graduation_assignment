Rails.application.routes.draw do
  # get 'reasons/create'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users

  root 'estimates#index'

  resources :estimates do
    resources :reasons
  end
  resources :products
  resources :customers


  get 'product/search' => 'products#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
