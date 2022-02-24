Rails.application.routes.draw do
  root 'home#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :users
  resources :rooms

  get 'rooms/search' => 'rooms#search'

  get 'users/show'
  get 'users/edit'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
