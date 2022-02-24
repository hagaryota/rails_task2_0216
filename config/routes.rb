Rails.application.routes.draw do
  get 'reservations/index'
  root 'home#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :users
  resources :rooms

  get 'reservations/search' => 'reservations#search'

  get 'users/show'
  get 'users/edit'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
